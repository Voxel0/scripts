replaceclosure(isreadonly, function(t)
  if t == syn then 
    return true 
  end 
end)
setreadonly(syn,false)
local req = syn.request
syn.request = function(args)
  if args.Url == 'https://api.darkhub.cloud/v3/roblox/checkKey' then 
    return {
      Body = 'OK'
    }
  end 
  return req(args)
end 
local isFile = isfile
isFile = hookfunc(isfile,function(str)
  if str:find('DarkHubKey.DARKHUB') then 
    return true 
  end 
  return isFile(str)
end)
local readFile = readfile 
readFile = hookfunc(readfile,function(str)
  if str:find('DarkHubKey.DARKHUB') then 
    return 'cheese'
  end 
  return readFile(str)
end)
