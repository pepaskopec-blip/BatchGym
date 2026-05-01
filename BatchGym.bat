@echo off

chcp 65001 > nul
color 0F
set money=1500
set pocet_zraneni=0

:start
cls
color 0B
echo : Právě jsi před vstupem do BG gym Neratovice.
echo : Cíl hry je dokončit trénink bez v posilovně s minimálním počtem zranění a s co nejvíce penězi.
pause
cls
echo : Stiskni 1 pokud jsi začátečník, 2 pokud jsi středně pokročilý, 3 pokud jsi pokročilý.
choice /c 123 /m "Vyber zkušenost s posilováním:"
if %errorlevel%==3 goto :zk_pokrocily
if %errorlevel%==2 goto :zk_stredne
if %errorlevel%==1 goto :zk_zacatecnik

:zk_zacatecnik
echo : Jsi začátečník v posilování. Doporučujeme ti začít s lehčími váhami a postupně zvyšovat zátěž.
pause
cls
goto :info

:zk_stredne
echo : Jsi středně pokročilý v posilování. Můžeš zkusit střední váhy a různé cviky. Ale vždy se před cvičením protáhni.
pause
cls
goto :info

:zk_pokrocily
echo : Jsi pokročilý v posilování. Můžeš zkusit těžší váhy a náročnější cviky. Určitě víš, že se musíš před cvičením protáhnout.
pause
cls
goto :info

:info
color 0B
echo : Vidíš na dveřích ceduli s otevírací dobou a ceníkem služeb:
echo : Otevírací doba je od 6:00 do 22:00.
pause
cls
echo : Ceník služeb:
echo : Vstup stojí 120Kč.
pause
echo : Chceš vstoupit do gymu? (ano/ne)
set /p vstup=
if /i %vstup%==ano goto :bar1
if /i %vstup%==ne (
    echo : Rozhodl ses nevstoupit do gymu.
    echo : Ještě si to mužeš rozmyslet.
    pause
    cls
    goto :start
)

:bar1
cls
color 05
echo : Na baru je obsluha a ptá se tě na jméno a příjmení.
set /p name=Zadej své jméno a příjmení: 
echo : Ahoj, návštěvníku jménem %name%! Vítáme tě v BG gym Neratovice.
pause
cls
color 0E
echo : Máš %money% Kč.
color 05
echo : Chceš si zaplatit vstup za 120Kč? nebo odejít z gymu (odejít/vstup)
set /p platba=
if /i %platba%==vstup goto :vstup
if /i %platba%==odejít (
    echo : Odejít z gymu.
    echo : Děkujeme za návštěvu BG gym Neratovice. Nashledanou!
    pause
    exit
)

:bar2
cls
color 05
echo : Jsi na baru. Můžeš si zde koupit něco na posilnění, nebo jít zpátky do šatny nebo odejít z gymu. (jídlo/šatna/odejít)
set /p bar_menu=
if /i %bar_menu%==jídlo goto :jidelni_listek
if /i %bar_menu%==šatna goto :satna
if /i %bar_menu%==odejít (
    echo : Odejít z gymu.
    echo : Děkujeme za návštěvu BG gym Neratovice. Nashledanou!
    pause
    exit
)

:jidelni_listek
pause
cls
color 0E
echo : máš %money% Kč.
color 05
echo : Můžeš si koupit, iontový nápoj, proteinovou tyčinku, nakopávač, proteinový nápoj, energetický nápoj nebo jít zpátky do šatny nebo odejít z gymu. (iontový/proteinová/nakopávač/proteinový/energetický)
set /p jidelni_listek=
if /i %jidelni_listek%==iontový (
    cls
    set /a money=%money%-50
    color 0E
    echo : Koupil jsi si iontový nápoj za 50Kč.
    echo : Zbývá ti %money% Kč.
    color 05
    pause
    cls
    goto :posl_opacko_bench
)
if /i %jidelni_listek%==proteinová (
    cls
    set /a money=%money%-80
    color 0E
    echo : Koupil jsi si proteinovou tyčinku za 80Kč.
    echo : Zbývá ti %money% Kč.
    color 05
    pause
    cls
    goto :posl_opacko_bench
)
if /i %jidelni_listek%==nakopávač (
    cls
    set /a money=%money%-60
    color 0E
    echo : Koupil jsi si nakopávač za 60Kč.
    echo : Zbývá ti %money% Kč.
    color 05
    pause
    cls
    goto :posl_opacko_bench
)
if /i %jidelni_listek%==proteinový (
    cls
    set /a money=%money%-100
    color 0E
    echo : Koupil jsi si proteinový nápoj za 100Kč.
    echo : Zbývá ti %money% Kč.
    color 05
    pause
    cls
    goto :posl_opacko_bench
)
if /i %jidelni_listek%==energetický (
    cls
    set /a money=%money%-70
    color 0E
    echo : Koupil jsi si energetický nápoj za 70Kč.
    echo : Zbývá ti %money% Kč.
    color 05
    pause
    cls
    goto :posl_opacko_bench
)

:vstup
cls
color 0A
set /a money=%money%-120
echo : Zaplatil jsi 120Kč za vstup.
color 0E
echo : Zbývá ti %money% Kč.
color 0A
echo : Užij si svůj trénink, návštěvníku %name%!
pause
cls
echo : Dostal jsi klíček od skříňky ve šatně.
echo : Teď můžeš jít do šatny.
goto :satna
pause

:satna
cls
color 0B
echo : Vstoupil jsi do šatny. Můžeš si zde odložit věci a převléknout se.
pause
cls
echo : Po převlečení se můžeš vydat do posilovny nebo jít kardio. Nebo odejít z gymu. (posilovna/kardio/odejít)
echo : Kam chceš jít? (posilovna/kardio)
set /p misto=
if /i %misto%==posilovna goto :posilovna
if /i %misto%==kardio goto :kardio
if /i %misto%==odejít (
    echo : Odejít z gymu.
    echo : Děkujeme za návštěvu BG gym Neratovice. Nashledanou!
    pause
    exit
)

:posilovna
color 0A
echo : Vstoupil jsi do posilovny.
pause
cls
echo : Chceš se před cvičením protáhnout? (ano/ne)
set /p protazeni=
if /i %protazeni%==ano (
    echo : Protáhl ses a jsi připraven na cvičení!
    pause
    cls
    echo : Začínáš s cvičením na bench pressu. Tento cvik posiluje tvé prsní svaly.
    pause
    cls
    pause
    cls
    echo : Začal jsi s warmum up serií na bench pressu. (váha 20kg)
    pause
    cls
    echo : Začínáš s první pracovní serií která obsahuje šest opakování (váha 50kg)
    pause
    cls
    echo : Stiskni enter pro každé opakování.
    pause
    cls
    echo : Dokončil jsi první opakování na bench pressu!
    pause
    cls
    echo : Dokončil jsi druhé opakování na bench pressu!
    pause
    cls
    echo : Dokončil jsi třetí opakování na bench pressu!
    pause
    cls
    echo : Dokončil jsi čtvrté opakování na bench pressu
    pause
    cls
    echo : Dokončil jsi páté opakování na bench pressu!
    pause
    cls
    echo : Už jsi vyčerpaný, pro dokončení jdi na recipci a kup si něco na posilnění.
    pause
    cls
    goto :bar2
)
if /i %protazeni%==ne (
    cls
    color 0C
    echo : Chyba! Měl by ses vždy před cvičením protáhnout.
    pause
    goto :nemocnice 
)
    
    :posl_opacko_bench
    cls
        color 0A
    echo : Posilnil jsi se na baru a jsi připraven pokračovat v cvičení na bench pressu.
    pause
    cls
    echo : Stiskni enter pro opakování.
    pause
    cls
    echo : Dokončil jsi poslední opakování na bench pressu!
    pause
    cls
    echo : Skvělá práce! Můžeš pokračovat na další cviky nebo odejít z gymu. (další/odejít)
    set /p dalsi_cviky=
    if /i %dalsi_cviky%==další (
        echo : Pokračuješ na další cviky.
        pause
        cls
        goto :incline_bench
)
    if /i %dalsi_cviky%==odejít (
        echo : Odejít z gymu.
        echo : Děkujeme za návštěvu BG gym Neratovice. Nashledanou!
        pause
        exit
    )

:incline_bench
color 0A
echo : Začal si cvičit na incline smith machine bench pressu.
pause
cls
set loop1=0
:anim_loop_start
cls
echo.
echo.
echo.
echo          [OO]==================[OO]
echo.
echo.
echo.
timeout /t 1 > nul
cls
echo.
echo.
echo                  [OO]
echo                 //
echo                //
echo               //
echo            [OO]
echo.
echo.
timeout /t 1 > nul
cls
echo.
echo.
echo              [OO]
echo               ^|^|
echo               ^|^|
echo               ^|^|
echo              [OO]
echo.
echo.
timeout /t 1 > nul
cls
echo.
echo.
echo           [OO]
echo            \\
echo             \\
echo              \\
echo               [OO]
echo.
echo.
timeout /t 1 > nul
set /a loop1=%loop1%+1
if %loop1% lss 3 goto :anim_loop_start
pause
cls
echo : Tento cvik zapojí horní část tvých prsních svalů.
pause
cls
echo : Jelikož už máš za sebou první cvik na bench pressu, můžeš začít rovnou s pracovní sérií (váha 50kg)
pause
cls
echo : Stiskni enter pro každé opakování.
pause
cls
echo : Dokončil jsi první opakování na incline bench pressu!
pause
cls
echo : Dokončil jsi druhé opakování na incline bench pressu!
pause
cls
echo : Dokončil jsi třetí opakování na incline bench pressu!
pause
cls
echo : Dokončil jsi čtvrté opakování na incline bench pressu!
pause
cls
echo : Dokončil jsi páté opakování na incline bench pressu!
pause
cls
echo : Dokončil jsi poslední opakování na incline bench pressu!
pause
cls
echo : Skvělá práce! Můžeš pokračovat na další cviky nebo odejít z gymu. (další/odejít)
    set /p dalsi_cviky=
    if /i %dalsi_cviky%==další (
        echo : Pokračuješ na další cviky.
        pause
        cls
        goto :triceps_pushdown
)
    if /i %dalsi_cviky%==odejít (
        echo : Odejít z gymu.
        echo : Děkujeme za návštěvu BG gym Neratovice. Nashledanou!
        pause
        exit
    )

:triceps_pushdown
color 0A
echo : Začal jsi cvičit na triceps pushdown stroji.
pause
cls
echo : Tento cvik posiluje tvé tricepsové svaly.
pause
cls
echo : Jelikož už jsi zahřátý, můžeš začít rovnou s pracovní sérií (váha 30kg)
pause
cls
echo : Stiskni enter pro každé opakování.
pause
cls
echo : Dokončil jsi první opakování na triceps pushdownu!
pause
cls
echo : Dokončil jsi druhé opakování na triceps pushdownu!
pause
cls
echo : Dokončil jsi třetí opakování na triceps pushdownu
pause
cls
echo : Dokončil jsi čtvrté opakování na triceps pushdown
pause
cls
echo : Dokončil jsi páté opakování na triceps pushdownu!
pause
cls
echo : Nepovedlo se ti dokončit poslední opakování na triceps pushdownu, jsi příliš unavený!
pause
cls
echo : Můžeš se jít někoho zeptat na radu nebo odejít z gymu. (rada/odejít)
set /p rada_odejit= 
if /i %rada_odejit%==rada (
    cls
    echo : Šel jsi se projít po fitku a můžeš se zaptat někoho na radu.
    echo : Potkal jsi trenéra, který ti doporučuje jít do kardio zóny pro zlepšení kondice.
    pause
    cls
    echo : Řekl ti že máš cvičit nejprve na nízkou rychlost potom zvýšit na střední rychlost, až to zvládneš můžeš tak pak napiš heslo "mangos67" pro pokračování triceps pushdownu.
    pause
    cls
    echo : Chceš jít do kardio zóny? (ano/ne)
    set /p kardio_zona=
    if /i %kardio_zona%==ano goto :kardio
    if /i %kardio_zona%==ne (
        echo : Rozhodl ses nepokračovat, můžeš jít do šatny nebo na bar. (šatna/bar)
        set /p misto= 
        if /i %misto%==šatna goto :satna
        if /i %misto%==bar goto :bar2
    )
)

:triceps_pushdown_dokoncil
cls
echo : Už máš kondici na dokončení tohoto cviku.
pause
cls
echo : Dokončil jsi poslední opakování na triceps pushdownu!
pause
cls
echo : Zbývá ti jen poslední cvik na dnešním tréninku.
pause
cls
echo : Můžeš pokračovat na poslední cvik nebo odejít z gymu. (další/odejít)
    set /p dalsi_cviky=
    if /i %dalsi_cviky%==další (
        echo : Pokračuješ na poslední cvik.
        pause
        cls
        goto :posledni_cvik
)
    if /i %dalsi_cviky%==odejít (
        echo : Odejít z gymu.
        echo : Děkujeme za návštěvu BG gym Neratovice. Nashledanou!
        pause
        exit
    )

:posledni_cvik
echo : Cvičíš rozpažování na strojích.
pause
cls
echo : Tento cvik posiluje tvé ramenní svaly.
pause
cls
echo : Chceš začít s warmup sérií? (ano/ne)
set /p warmup=
if /i %warmup%==ano (
    echo : Začínáš s warmup sérií (váha 10kg)
    pause
    cls
    echo : Dokončil jsi warmup sérii na rozpažování!
    pause
    cls
    goto :pracovni_serie_ramen
)
if /i %warmup%==ne (
    cls
    echo : Chyba! Měl by ses vždy před cvičením warmupnout.
    goto :nemocnice 
)

:pracovni_serie_ramen
echo : Začínáš s pracovní sérií která obsahuje šest opakování (váha 25kg)
pause
cls
echo : Než začneš, řekni mi kdo je nejznámější kluturista všech dob? (pokud určitě víš napiš pouze křestní jméno, první písmeno musí být velké, pokud nevíš tak napiš ne)
set /p kulturista=
if %kulturista%==Arnold (
    cls
    echo : Správná odpověď! Můžeš pokračovat v rozpažování.
    pause
    cls
    goto :dokoncit_ramen
)
if /i %kulturista%==ne (
    echo :Nevíš?! To je špatně! Měl bys vědět kdo je nejznámější kulturista všech dob!
    echo : Je to přece Arnold!
    pause
    cls
    echo : Musíš začít odznova.
    pause
    cls
    goto :start
)

:dokoncit_ramen
echo : Stiskni enter pro každé opakování.
pause
cls
echo : Dokončil jsi první opakování na rozpažování!
pause
cls
echo : Dokončil jsi druhé opakování na rozpažování!
pause
cls
echo : Dokončil jsi třetí opakování na rozpažování!
pause
cls
echo : Dokončil jsi čtvrté opakování na rozpažování
pause
cls
echo : Dokončil jsi páté opakování na rozpažování!
pause
cls
echo : Dokončil jsi poslední opakování na rozpažování!
pause
cls
echo : Gratuluji! Dokončil jsi celý trénink!
goto :finish

:kardio
color 09
echo : Vstoupil jsi do kardio zóny.
pause
cls
echo : Začínáš s během na běžeckém pásu.
pause
cls
echo : Zvol rychlost na běžeckém pásu (nízká/střední/vysoká)
set /p rychlost=
if /i %rychlost%==nízká (
    cls
    echo : .
    timeout /t 1 > nul
    echo : ..
    timeout /t 1 > nul
    echo : ...
    timeout /t 1 > nul
    echo : ....
    timeout /t 1 > nul
    echo : .....
    timeout /t 1 > nul
    pause
    cls
    echo : Rozehřál jsi nohy a pokračuješ v běhu.
    pause
    cls
    goto :vyssi_rychlost
)
if /i %rychlost%==střední goto :vyssi_rychlost
if /i %rychlost%==vysoká (
    cls
    color 0C
    echo : .
    timeout /t 1 > nul
    echo : ..
    timeout /t 1 > nul
    echo : ...
    timeout /t 1 > nul
    echo : ....
    timeout /t 1 > nul
    echo : .....
    timeout /t 1 > nul
    pause
    cls
    echo : Běžíš rychle, ale začínáš s moc vysokou rychlostí bez rozehřátí a ptoto jsi si zranil nohu!
    pause
    cls
    goto :nemocnice
)

:vyssi_rychlost
echo : Nastavuješ rychlost na střední úroveň.
pause
cls
echo : .
    timeout /t 1 > nul
    echo : ..
    timeout /t 1 > nul
    echo : ...
    timeout /t 1 > nul
    echo : ....
    timeout /t 1 > nul
    echo : .....
    timeout /t 1 > nul
    pause
    cls
    echo : Spálil jsi docela dost kaloriií a posílil svou kondici.
    echo : Znáš heslo tajné heslo? (zadej heslo/ne)
    set /p heslo=
    if %heslo%==mangos67 (
    cls
    echo : Správné heslo! Můžeš pokračovat v triceps pushdownu.
    pause
    cls
    goto :triceps_pushdown_dokoncil
)
if /i %heslo%==ne (
   goto :kardio_dalsi
)
else (
    cls
    echo : Špatné heslo! Musíš začít odznova.
    pause
    cls
    goto :start
)

:kardio_dalsi
pause
cls
echo : Chceš pokračovat na vysokou rychlost? (ano/ne)
set /p pokracovani=
if /i %pokracovani%==ano (
    cls
    color 0C
    echo : Zvyšuješ rychlost na vysokou úroveň.
    echo : .
    timeout /t 1 > nul
    echo : ..
    timeout /t 1 > nul
    echo : ...
    timeout /t 1 > nul
    echo : ....
    timeout /t 1 > nul
    echo : .....
    timeout /t 1 > nul
    pause
    cls
    echo : Běžíš rychle, ale byl jsi tak unavený že jsi upadl a zranil se!
    pause
    cls
    goto :nemocnice
)
if /i %pokracovani%==ne (
    echo : Rozhodl se nepokračovat, můžeš jít do šatny nebo na bar. (šatna/bar)
    set /p misto=
    if /i %misto%==šatna goto :satna
    if /i %misto%==bar goto :bar2
)

:nemocnice
cls
color 0C
echo : Při tréninku jsi utrpěl zranění a musíš jít do nemocnice.
set /a pocet_zraneni=%pocet_zraneni%+1
echo : Počet tvých zranění je nyní %pocet_zraneni%.
pause
cls
echo : V nemocnici ti lékaři doporučují ošetření.
pause cls
echo : Chceš se nechat ošetřit? (ano/ne)
set /p osetreni=
if /i %osetreni%==ano (
    goto :osetreni
)
if /i %osetreni%==ne (
    echo : Nenechal ses ošetřit a kvůli tomu jsi zemřel.
    echo : Konec hry.
    pause
    exit
)

:osetreni
cls
echo : Stojí tě to 500Kč za ošetření.
set /a money=%money%-500
echo : Po ošetření ti zbývá %money% Kč.
pause
cls
echo : Po uzdravení se můžeš vrátit do gymu.
pause
goto :start

:finish
cls
color 0D
echo : Gratuluji! Návštěvníku jménem %name%, dokončil jsi trénink v BG gym Neratovice s počtem zranění %pocet zraneni% a %money% Kč!
pause
set loop=0
:anim_loop_finish
cls
echo.
echo.
echo.
echo          [OO]==================[OO]
echo.
echo.
echo.
timeout /t 1 > nul
cls
echo.
echo.
echo                  [OO]
echo                 //
echo                //
echo               //
echo            [OO]
echo.
echo.
timeout /t 1 > nul
cls
echo.
echo.
echo              [OO]
echo               ^|^|
echo               ^|^|
echo               ^|^|
echo              [OO]
echo.
echo.
timeout /t 1 > nul
cls
echo.
echo.
echo           [OO]
echo            \\
echo             \\
echo              \\
echo               [OO]
echo.
echo.
timeout /t 1 > nul
set /a loop=%loop%+1
if %loop% lss 3 goto :anim_loop_finish
cls
echo  ____ ___                                                 __       .__      .___      __                       .__.__    .__                                        __        .__            __      ._._._.
echo ^|    ^|   \____________   ____   ______ ____   ____       ^|__^| _____^|__^|   __^| _/____ ^|  ^| ______   ____   ____ ^|__^|  ^|   ^|  ^|_________ __ __     ________________ _/  ^|_ __ __^|  ^|  __ __   ^|__^|__ __^| ^| ^| ^|
echo ^|    ^|   /  ___/\____ \_/ __ \ /  ___//    \_/ __ \      ^|  ^|/  ___/  ^|  / __ ^|/  _ \^|  ^|/ /  _ \ /    \_/ ___\^|  ^|  ^|   ^|  ^|  \_  __ \  ^|  \   / ___\_  __ \__  \\   __\  ^|  \  ^| ^|  ^|  \  ^|  ^|  ^|  \ ^| ^| ^|
echo ^|    ^|  /\___ \ ^|  ^|_^> ^>  ___/ \___ \^|   ^|  \  ___/      ^|  ^|\___ \^|  ^| / /_/ (  ^<_^> )    ^<  ^<_^> )   ^|  \  \___^|  ^|  ^|__ ^|   Y  \  ^| \/  ^|  /  / /_/  ^>  ^| \// __ \^|  ^| ^|  ^|  /  ^|_^|  ^|  /  ^|  ^|  ^|  /\^|\^|\^|
echo ^|______//____  ^>^|   __/ \___  ^>____  ^>___^|  /\___  ^> /\__^|  /____  ^>__^| \____ ^|\____/^|__^|_ \____/^|___^|  /\___  ^>__^|____/ ^|___^|  /__^|  ^|____/   \___  /^|__^|  (____  /__^| ^|____/^|____/____/\__^|  ^|____/ ______
echo              \/ ^|__^|        \/     \/     \/     \/  \______^|    \/          \/           \/          \/     \/               \/              /_____/            \/                     \______^|      \/\/\/
echo.
pause