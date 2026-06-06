pabot `
    --processes 7 `
    --testlevelsplit `
    --outputdir results `
    --listener allure_robotframework:results/allure-results `
    --outputdir results `
    tests/register-invalid.robot

allure generate results/allure-results `
                -o results/allure-report `
                --clean

allure open results/allure-report
