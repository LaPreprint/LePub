// Function to run quarto with error handling for testing
async function testQuarto(args, expectError = false) {
  try {
    const command = new Deno.Command("quarto", {
      args: args,
    });
    
    const { code, stdout, stderr } = await command.output();
    const stdoutText = new TextDecoder().decode(stdout);
    const stderrText = new TextDecoder().decode(stderr);
    
    if (expectError && code === 0) {
      console.log("❌ Test failed: Expected an error but command succeeded");
      return false;
    } else if (!expectError && code !== 0) {
      console.log("❌ Test failed: Command failed unexpectedly");
      console.error(stderrText);
      return false;
    } else {
      console.log("✓ Test passed");
      return true;
    }
  } catch (error) {
    if (expectError) {
      console.log("✓ Test passed: Got expected error");
      return true;
    } else {
      console.log("❌ Test failed: Unexpected error");
      console.error(error);
      return false;
    }
  }
}

// Example test cases
async function runTests() {
  // Test 1: Valid file without any parameters should succeed
  await testQuarto(["render", "quarto/example.qmd"], false);
  
  // Test 2: Invalid file should fail
  await testQuarto(["render", "nonexistent_file.qmd"], true);

  // Parts
  await testQuarto(["render", "quarto/example.qmd", "--metadata-file", "tests/quarto/data-empty.yml"], false);
  await testQuarto(["render", "quarto/example.qmd", "--metadata-file", "tests/quarto/data-correct.yml"], false);

  // // margin-side
  // await testQuarto(["render", "quarto/example.qmd", "-M", "margin-side:left"], false);
  // await testQuarto(["render", "quarto/example.qmd", "-M", "margin-side:right"], false);

  // // line-numbers
  // await testQuarto(["render", "quarto/example.qmd", "-M", "line-numbers:true"], false);
  // await testQuarto(["render", "quarto/example.qmd", "-M", "line-numbers:'string'"], true);
}

// theme-color: "#FF5733"
// margin-side: right
// word-count: true
// parts:
//   funding: |
//     This work was supported by the Swiss National Science Foundation (SNSF; https://www.snf.ch/en) Ambizione Fellowship PZ00P3_180085 (to AH), SNSF Starting Grant TMSGI3_211369 (to AH), and SNSF National Centre of Competence in Research (NCCR) AntiResist (to AH; grant number 180541). The funder played no role in the study design, data collection and analysis, decision to publish, or preparation of the manuscript.
//   data-availability: |
//     Data is available a cool place.
// bibliographystyle: vancouver-brackets.csl

await runTests();