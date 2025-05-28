*** Variables ***
# Content Type Headers
${CONTENT_TYPE_JSON}    application/json

# API Base URL
${BASE_URL}    https://restful-booker.herokuapp.com

# Authentication Credentials
${DEFAULT_USERNAME}    admin
${DEFAULT_PASSWORD}    password123

# Default Booking Information
${DEFAULT_FIRSTNAME}    Testum
${DEFAULT_LASTNAME}    Bookingum
${DEFAULT_TOTALPRICE}    201
${DEFAULT_DEPOSITPAID}    ${True}
${DEFAULT_ADDITIONALNEEDS}    'Milk allergy'

# Default Booking Dates
${DEFAULT_CHECKIN}    2025-12-14
${DEFAULT_CHECKOUT}    2026-01-14

# Updated Booking Information
${UPDATED_FIRSTNAME}    Testdois
${UPDATED_LASTNAME}    Bookingdois
${UPDATED_TOTALPRICE}    202
${UPDATED_DEPOSITPAID}    ${False}
${UPDATED_CHECKIN}    2025-12-26
${UPDATED_CHECKOUT}    2026-01-26

# Partial Update Information
${PARTIAL_UPDATE_FIRSTNAME}    Testoito
${PARTIAL_UPDATE_DEPOSITPAID}    ${False}