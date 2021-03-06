% Copyright 2020 The MathWorks, Inc.

% Configure logged in user if possible
first_name = getenv('MW_LOGIN_FIRST_NAME');
last_name = getenv('MW_LOGIN_LAST_NAME');
email_address = getenv('MW_LOGIN_EMAIL_ADDRESS');
user_id = getenv('MW_LOGIN_USER_ID');
profile_id = getenv('MW_LOGIN_PROFILE_ID');
display_name = getenv('MW_LOGIN_DISPLAY_NAME');
if (strlength(user_id) > 0)
    li = com.mathworks.matlab_login.MatlabLogin.isUserLoggedIn(2, 'DESKTOP');
    token = li.getToken();
    login_level = 2;
    remember_me = true;
    com.mathworks.matlab_login.MatlabLogin.saveCacheLoginInfo(first_name, last_name, email_address, user_id, token, profile_id, login_level, remember_me, email_address, display_name);
end

if (strlength(getenv('BASE_URL')) > 0)
    connector.internal.setConfig('contextRoot', getenv('BASE_URL'))
end
connector.internal.Worker.start
clear