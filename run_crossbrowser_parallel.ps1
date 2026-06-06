pabot `
    --processes 2 `
    --argumentfile1 chrome.txt `
    --argumentfile2 firefox.txt `
    --listener RetryFailed:1 `
    --listener allure_robotframework:results/allure-results `
    --outputdir results `
    tests/login_logout.robot

allure generate results/allure-results `
                -o results/allure-report `
                --clean

allure open results/allure-report
