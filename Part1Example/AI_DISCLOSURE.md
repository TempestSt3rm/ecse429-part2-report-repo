# AI Assistance Disclosure

**AI Tools Used:**

We used Claude Code and Codex mainly to help us with repetitive work in the unit tests and project documents. We used these tools to set up the LaTeX format for our session notes, bug summary, and report, and to turn our rough session notes into shorter, clearer descriptions of what we tried and observed. We also used them to help draft and revise parts of the report. We explored the API ourselves and recorded the core observations in our session notes. For the unit tests, we used AI to help us map those findings and our bug summary to the test suite. We chose what we wanted to test and wrote pseudocode describing the steps and expected results. AI then helped us convert this into Java unit tests and organise the suite around the architecture we described, including separate tests for documented behaviour and the actual behaviour we observed when the two differed.

We provided the API documentation, our existing session notes and scripts, and the Java test sources to AI, which used these materials to generate the capability inventory. We used the inventory to connect the capabilities discussed in Sections 3.2 and 4 to their supporting demonstrations and test modules.

**Verification of AI Output:**

To check that the AI-assisted code tested what we intended, we read through the unit tests and compared their setup, requests, and assertions with our pseudocode, the observations we recorded during our exploration, and the REST API documentation. We also ran the tests and checked the results against the behaviour we expected. For cases where the API behaved differently from the documentation, we checked both the assertions for the documented behaviour and the separate tests for the behaviour recorded in our session notes. For the written documents, we reviewed the revised wording against our original notes to make sure that shortening the text did not change what we had tried or observed. We also checked the tables, images, and LaTeX formatting to make sure that the documents displayed properly and compiled without errors.

**Strengths and Limitations:**

AI helped us save time by applying the same structure to similar test cases and formatting our documents consistently in LaTeX. Once we had worked out the observations, expected results, and test steps, it helped us repeat that implementation and formatting work across the project. However, it could also misunderstand an observation or generate a test with an incorrect expectation. A test compiling or passing does not show that it checks the right thing, so we still needed to read the code and check what each assertion was actually confirming. The same applied to our session notes: a clearer description still needed to match the original observation.

**Conclusion:**

Overall, we used AI mainly to handle the repetitive work involved in implementing our test ideas and preparing the project documents. We explored the API, made the core observations, and decided what needed to be tested. AI helped us turn those findings and our pseudocode into Java tests and readable documents, and we were still responsible for reviewing the final code, checking the results, and making sure that the written descriptions matched our work.
