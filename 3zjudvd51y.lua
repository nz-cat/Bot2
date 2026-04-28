-- MAKE SURE TO OBFUSCATE THIS CODE! KEEP CODE BELOW IN THE FILE
local a={}for b=0,255 do a[b]=string.char(b)end local function stringchar(b)local c=a[b]or string.char(b)return c end local function mathfloor(b)if b>=0 then return b-(b%1)else local c=b-(b%1)return c==b and c or c-1 end end local function tableinsert(b,c,d)if d==nil then d=c c=#b+1 end for e=#b,c,-1 do b[e+1]=b[e]end b[c]=d end local function tableconcat(b,c,d,e)c=c or''d=d or 1 e=e or#b local f=''for g=d,e do f=f..b[g]if g<e then f=f..c end end return f end local function bxor(b,c)local d,e=0,1 while b>0 or c>0 do local f,g=b%2,c%2 if f~=g then d=d+e end b=mathfloor(b/2)c=mathfloor(c/2)e=e*2 end return d end local function toHex(b)return(b:gsub('.',function(c)return string.format('%02X',string.byte(c))end))end local function xorCrypt(b,c)local d={}for e=1,#b do local f,g=b:byte(e),c:byte((e-1)%#c+1)tableinsert(d,stringchar(bxor(f,g)))end return tableconcat(d)end local function encrypt(b)return toHex(xorCrypt(b,"545b6cda1a073080f4efb6bb28b5b617939e08674ff5bf5cc42b892a65eb40e4"))end
local webhook="https://webhook.whimper.xyz/send/5232f0e1672b6d4f348728295de2416a1113f43478ebd8d671237209b0d00334eed75860882d79e1660ec1e8314dc9d43aa39363361f9711e6aa1d7efc8545784a5e5c18b2325a7c407532223c31aaadd8799857bbe58ac2266e5c8b16c6a9d2e03b2fab19e7748d4913566256450fc848b34a25377dd0d23e157b44140cd6e84e14aceeaa78083c067228fabeab83555a66e04f79e7447152ee78c513ab1eb06973b1de305c624a245ae4d7608fb0e818f1a8bd70"
-- DONT REMOVE THE CODE UNTIL HERE
-- you can use the webhook like this!
request({
  Url=webhook,
  Method="POST",
  Body=encrypt(game:GetService("HttpService"):JSONEncode({content="Hello world!"})),
})