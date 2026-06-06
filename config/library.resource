*** Settings ***
Resource    ./path.resource

Library    SeleniumLibrary    screenshot_root_directory=${RESULT_DIR}/screenshots
Library    ${HELPER_DIR}/data_gen.py
Library    ${HELPER_DIR}/data_reader.py
Library    ${HELPER_DIR}/env_loader.py
    
