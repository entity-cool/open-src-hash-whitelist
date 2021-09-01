getgenv().AuthKey = 'key here'

--[[
!!YOU MAY NOT USE THIS WITHOUT OPEN SOURCING IT (THIS INCLUDES ANY CODE YOU ADD/MODIFY)!!
This is just for learning, you may not use this in production without open sourcing it.

Inspired by Aztup's open source whitelist
]]

--[[
Copyright 2021 0x37 enterprise

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
]]

local auth = AuthKey or ''

-- $ randomstring https://gist.github.com/haggen/2fd643ea9a261fea2094
-- $ sha256 supplied by Applebee 

-- $ randomstring, make your own that doesn't rely on math.random
local charset = {} 
for c = 48, 57  do table.insert(charset, string.char(c)) end
for c = 65, 90  do table.insert(charset, string.char(c)) end
for c = 97, 122 do table.insert(charset, string.char(c)) end

local rand = function()
    local str = ''
    for i = 1,8 do
        str = str .. charset[math.random(1, #charset)]
    end
    return str
end

-- $ sha256
local hash = function(a)local b={[0]={"00","\0"},[1]={"01","\1"},[2]={"02","\2"},[3]={"03","\3"},[4]={"04","\4"},[5]={"05","\5"},[6]={"06","\6"},[7]={"07","\7"},[8]={"08","\8"},[9]={"09","\9"},[10]={"0a","\10"},[11]={"0b","\11"},[12]={"0c","\12"},[13]={"0d","\13"},[14]={"0e","\14"},[15]={"0f","\15"},[16]={"10","\16"},[17]={"11","\17"},[18]={"12","\18"},[19]={"13","\19"},[20]={"14","\20"},[21]={"15","\21"},[22]={"16","\22"},[23]={"17","\23"},[24]={"18","\24"},[25]={"19","\25"},[26]={"1a","\26"},[27]={"1b","\27"},[28]={"1c","\28"},[29]={"1d","\29"},[30]={"1e","\30"},[31]={"1f","\31"},[32]={"20","\32"},[33]={"21","\33"},[34]={"22","\34"},[35]={"23","\35"},[36]={"24","\36"},[37]={"25","\37"},[38]={"26","\38"},[39]={"27","\39"},[40]={"28","\40"},[41]={"29","\41"},[42]={"2a","\42"},[43]={"2b","\43"},[44]={"2c","\44"},[45]={"2d","\45"},[46]={"2e","\46"},[47]={"2f","\47"},[48]={"30","\48"},[49]={"31","\49"},[50]={"32","\50"},[51]={"33","\51"},[52]={"34","\52"},[53]={"35","\53"},[54]={"36","\54"},[55]={"37","\55"},[56]={"38","\56"},[57]={"39","\57"},[58]={"3a","\58"},[59]={"3b","\59"},[60]={"3c","\60"},[61]={"3d","\61"},[62]={"3e","\62"},[63]={"3f","\63"},[64]={"40","\64"},[65]={"41","\65"},[66]={"42","\66"},[67]={"43","\67"},[68]={"44","\68"},[69]={"45","\69"},[70]={"46","\70"},[71]={"47","\71"},[72]={"48","\72"},[73]={"49","\73"},[74]={"4a","\74"},[75]={"4b","\75"},[76]={"4c","\76"},[77]={"4d","\77"},[78]={"4e","\78"},[79]={"4f","\79"},[80]={"50","\80"},[81]={"51","\81"},[82]={"52","\82"},[83]={"53","\83"},[84]={"54","\84"},[85]={"55","\85"},[86]={"56","\86"},[87]={"57","\87"},[88]={"58","\88"},[89]={"59","\89"},[90]={"5a","\90"},[91]={"5b","\91"},[92]={"5c","\92"},[93]={"5d","\93"},[94]={"5e","\94"},[95]={"5f","\95"},[96]={"60","\96"},[97]={"61","\97"},[98]={"62","\98"},[99]={"63","\99"},[100]={"64","\100"},[101]={"65","\101"},[102]={"66","\102"},[103]={"67","\103"},[104]={"68","\104"},[105]={"69","\105"},[106]={"6a","\106"},[107]={"6b","\107"},[108]={"6c","\108"},[109]={"6d","\109"},[110]={"6e","\110"},[111]={"6f","\111"},[112]={"70","\112"},[113]={"71","\113"},[114]={"72","\114"},[115]={"73","\115"},[116]={"74","\116"},[117]={"75","\117"},[118]={"76","\118"},[119]={"77","\119"},[120]={"78","\120"},[121]={"79","\121"},[122]={"7a","\122"},[123]={"7b","\123"},[124]={"7c","\124"},[125]={"7d","\125"},[126]={"7e","\126"},[127]={"7f","\127"},[128]={"80","\128"},[129]={"81","\129"},[130]={"82","\130"},[131]={"83","\131"},[132]={"84","\132"},[133]={"85","\133"},[134]={"86","\134"},[135]={"87","\135"},[136]={"88","\136"},[137]={"89","\137"},[138]={"8a","\138"},[139]={"8b","\139"},[140]={"8c","\140"},[141]={"8d","\141"},[142]={"8e","\142"},[143]={"8f","\143"},[144]={"90","\144"},[145]={"91","\145"},[146]={"92","\146"},[147]={"93","\147"},[148]={"94","\148"},[149]={"95","\149"},[150]={"96","\150"},[151]={"97","\151"},[152]={"98","\152"},[153]={"99","\153"},[154]={"9a","\154"},[155]={"9b","\155"},[156]={"9c","\156"},[157]={"9d","\157"},[158]={"9e","\158"},[159]={"9f","\159"},[160]={"a0","\160"},[161]={"a1","\161"},[162]={"a2","\162"},[163]={"a3","\163"},[164]={"a4","\164"},[165]={"a5","\165"},[166]={"a6","\166"},[167]={"a7","\167"},[168]={"a8","\168"},[169]={"a9","\169"},[170]={"aa","\170"},[171]={"ab","\171"},[172]={"ac","\172"},[173]={"ad","\173"},[174]={"ae","\174"},[175]={"af","\175"},[176]={"b0","\176"},[177]={"b1","\177"},[178]={"b2","\178"},[179]={"b3","\179"},[180]={"b4","\180"},[181]={"b5","\181"},[182]={"b6","\182"},[183]={"b7","\183"},[184]={"b8","\184"},[185]={"b9","\185"},[186]={"ba","\186"},[187]={"bb","\187"},[188]={"bc","\188"},[189]={"bd","\189"},[190]={"be","\190"},[191]={"bf","\191"},[192]={"c0","\192"},[193]={"c1","\193"},[194]={"c2","\194"},[195]={"c3","\195"},[196]={"c4","\196"},[197]={"c5","\197"},[198]={"c6","\198"},[199]={"c7","\199"},[200]={"c8","\200"},[201]={"c9","\201"},[202]={"ca","\202"},[203]={"cb","\203"},[204]={"cc","\204"},[205]={"cd","\205"},[206]={"ce","\206"},[207]={"cf","\207"},[208]={"d0","\208"},[209]={"d1","\209"},[210]={"d2","\210"},[211]={"d3","\211"},[212]={"d4","\212"},[213]={"d5","\213"},[214]={"d6","\214"},[215]={"d7","\215"},[216]={"d8","\216"},[217]={"d9","\217"},[218]={"da","\218"},[219]={"db","\219"},[220]={"dc","\220"},[221]={"dd","\221"},[222]={"de","\222"},[223]={"df","\223"},[224]={"e0","\224"},[225]={"e1","\225"},[226]={"e2","\226"},[227]={"e3","\227"},[228]={"e4","\228"},[229]={"e5","\229"},[230]={"e6","\230"},[231]={"e7","\231"},[232]={"e8","\232"},[233]={"e9","\233"},[234]={"ea","\234"},[235]={"eb","\235"},[236]={"ec","\236"},[237]={"ed","\237"},[238]={"ee","\238"},[239]={"ef","\239"},[240]={"f0","\240"},[241]={"f1","\241"},[242]={"f2","\242"},[243]={"f3","\243"},[244]={"f4","\244"},[245]={"f5","\245"},[246]={"f6","\246"},[247]={"f7","\247"},[248]={"f8","\248"},[249]={"f9","\249"},[250]={"fa","\250"},[251]={"fb","\251"},[252]={"fc","\252"},[253]={"fd","\253"},[254]={"fe","\254"},[255]={"ff","\255"}}local c,d,e,f,g=bit32.band,bit32.rrotate,bit32.bxor,bit32.rshift,bit32.bnot;local string,assert=string,assert;local h={0x428a2f98,0x71374491,0xb5c0fbcf,0xe9b5dba5,0x3956c25b,0x59f111f1,0x923f82a4,0xab1c5ed5,0xd807aa98,0x12835b01,0x243185be,0x550c7dc3,0x72be5d74,0x80deb1fe,0x9bdc06a7,0xc19bf174,0xe49b69c1,0xefbe4786,0x0fc19dc6,0x240ca1cc,0x2de92c6f,0x4a7484aa,0x5cb0a9dc,0x76f988da,0x983e5152,0xa831c66d,0xb00327c8,0xbf597fc7,0xc6e00bf3,0xd5a79147,0x06ca6351,0x14292967,0x27b70a85,0x2e1b2138,0x4d2c6dfc,0x53380d13,0x650a7354,0x766a0abb,0x81c2c92e,0x92722c85,0xa2bfe8a1,0xa81a664b,0xc24b8b70,0xc76c51a3,0xd192e819,0xd6990624,0xf40e3585,0x106aa070,0x19a4c116,0x1e376c08,0x2748774c,0x34b0bcb5,0x391c0cb3,0x4ed8aa4a,0x5b9cca4f,0x682e6ff3,0x748f82ee,0x78a5636f,0x84c87814,0x8cc70208,0x90befffa,0xa4506ceb,0xbef9a3f7,0xc67178f2}local function i(j,k)local l=""local m=""for n=1,k do local o=j%256;l=b[o][2]..l;m=b[o][1]..m;j=(j-o)/256 end;return m,l end;local function p(q,n)local k=0;for n=n,n+3 do k=k*256+string.byte(q,n)end;return k end;local function r(s,t)local u=-(t+1+8)%64;_,t=i(8*t,8)tlen=""s=s.."\128"..string.rep("\0",u)..t;assert(#s%64==0)return s end;local function v(w)w[1]=0x6a09e667;w[2]=0xbb67ae85;w[3]=0x3c6ef372;w[4]=0xa54ff53a;w[5]=0x510e527f;w[6]=0x9b05688c;w[7]=0x1f83d9ab;w[8]=0x5be0cd19;return w end;local function x(s,n,w)local y={}for z=1,16 do y[z]=p(s,n+(z-1)*4)end;for z=17,64 do local A=y[z-15]local B=e(d(A,7),d(A,18),f(A,3))A=y[z-2]local l=e(d(A,17),d(A,19),f(A,10))y[z]=y[z-16]+B+y[z-7]+l end;local C,D,E,F,G,H,I,J=w[1],w[2],w[3],w[4],w[5],w[6],w[7],w[8]for n=1,64 do local B=e(d(C,2),d(C,13),d(C,22))local K=e(c(C,D),c(C,E),c(D,E))local L=B+K;local l=e(d(G,6),d(G,11),d(G,25))local M=e(c(G,H),c(g(G),I))local N=J+l+M+h[n]+y[n]J=I;I=H;H=G;G=F+N;F=E;E=D;D=C;C=N+L end;w[1]=c(w[1]+C)w[2]=c(w[2]+D)w[3]=c(w[3]+E)w[4]=c(w[4]+F)w[5]=c(w[5]+G)w[6]=c(w[6]+H)w[7]=c(w[7]+I)w[8]=c(w[8]+J)end;local function O(w)return i(w[1],4)..i(w[2],4)..i(w[3],4)..i(w[4],4)..i(w[5],4)..i(w[6],4)..i(w[7],4)..i(w[8],4)end;local P={}local function Q(s)s=r(s,#s)local w=v(P)for n=1,#s,64 do x(s,n,w)end;return O(w)end;return Q(a)end

-- $ crash func
local crash
crash = function()
    repeat crash() until nil
end

-- $ Basic EQ check function, more secure than just checking if a == b 
local EQ = function (a,b)
    if 1 == 1 then
        if type(a) == type(b) and type(b) == type(a) then
            if typeof(a) == typeof(b) then
                if a == b and b == a then
                    if 1 == 2 then crash() end
                    return true
                else
                    if 2 == 1 then crash() end
                    return false
                end
            else
                if 2 == 3 then crash() end
                return false
            end
        else
            if 69 ~= 69 then crash() end
            return false
        end
    else
        crash()
    end
end

-- $ Hypernite hash spy fucker thing

for i = 1, 500 do
    hash('get hyper')
end

-- $ Main
local rStr = rand()

-- ! Add function names so it appears normal in constant dumps, very cool yes, secure this more okay, this is just to make it harder to check hash
local expRes = hash(rStr .. 'request' .. rStr .. 'table.foreach' .. rStr .. 'FindFirstChild' .. auth)

-- ! Check if exploit has http request function
local http_request = (http_request or request or (syn and syn.request) or false)
if EQ(http_request, false) then crash() end

-- ! Request moment, secure this
local response = http_request({
    Url = ('http://localhost:8080/checkwl/%s/%s'):format(rStr, auth),
    Method = 'GET'
})

if EQ(response.Body, expRes) then
    if EQ(response.StatusCode, 200) then
        if 1 ~= 1 then crash() end
        print('whitelisted')
        print('Server Response:', response.Body)
    else
        crash()
    end
else
    game:service'Players'.LocalPlayer:Kick('Failed to authenticate: ' .. response.Body)
end
