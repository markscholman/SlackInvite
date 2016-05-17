$requestBody = Get-Content $Env:req -Raw | ConvertFrom-Json
$email = $requestBody.email
if ($Env:req_query_email) 
{
    $email = $Env:req_query_email
}

$token = '<token>' #get token here: https://api.slack.com/docs/oauth-test-tokens
$channels = '<channels-to-auto-join>'
$epoch = [int64](([datetime]::UtcNow)-(get-date "1/1/1970")).TotalSeconds
$body = @{
    email = $email
    token = $token
    channels = $channels
}
$result = Invoke-RestMethod -Uri https://<team-name>.slack.com/api/users.admin.invite?t=$epoch -Method Post -Body $body
Out-File -Encoding Ascii $Env:res -inputObject "Invite sent to $email"