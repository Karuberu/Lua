--[[
enternity v1.20131102

Copyright (c) 2013, Giuliano Riccio
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.
* Redistributions in binary form must reproduce the above copyright
notice, this list of conditions and the following disclaimer in the
documentation and/or other materials provided with the distribution.
* Neither the name of enternity nor the
names of its contributors may be used to endorse or promote products
derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Giuliano Riccio BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

require 'sets'


_addon.name    = 'enternity'
_addon.author  = 'Zohno'
_addon.version = '1.20131102'

blist = S{
    -- Paintbrush of souls dialogue
    17428966,

    -- Geomantic Reservoirs (for Geo spells)
    17191568,
    17195708,
    17195711,
    17207951,
    17220195,
    17228405,
    17232298,
    17232301,
    17236352,
    17257105,
    17269286,
    17293798,
    17297495,
    17379863,
    17388046,
    17396261,
    17424561,
    17461578,
    17531229,
    17576434,
    17580414,
    17584499,
    17596857,
    17613247,
    17842739,
    17846832,
    17850967,
    17863497,
    17863500,
}

windower.register_event('incoming text', function(original, modified, mode)
    if (mode == 150 or mode == 151) and not original:match(string.char(0x1e, 0x02)) then
        local target = windower.ffxi.get_mob_by_target('t')
        if not (target and blist:contains(target.id)) then
            modified = modified:gsub(string.char(0x7F, 0x31), '')
        end
    end

    return modified
end)
