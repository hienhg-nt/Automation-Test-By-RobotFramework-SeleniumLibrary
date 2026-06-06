# 1. Run test
robot `
    --listener allure_robotframework:results/allure-results `
    --outputdir results `
    tests/

# 2. Generate report
allure generate results/allure-results `
                -o results/allure-report `
                --clean

# 3. Open report
allure open results/allure-report
