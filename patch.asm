//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxx    Project Information in English    xxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxx    Informações Sobre o Projeto em Português    xxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxxxxxxxxxxxx    Game    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxxxx    Projeto    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//                      Game translation project:                           //                    Projeto de tradução do Jogo:                          //
//                   Dragon Ball Z - Hyper Dimension                        //                   Dragon Ball Z - Hyper Dimension                        //
//               of Super Nintendo for Brazilian Portuguese                 //              de Super Nintendo para o Português do Brasil                //
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxxxxxxxxxxx    Thanks    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxx    Agradecimentos    xxxxxxxxxxxxxxxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//    I have to thank Anime_World a lot, he is a Brazilian romhacker and    //     Eu tenhos que agradecer muito ao Anime_World, ele é um romhacker     //
//       my Sensei, thanks man, for putting up with me all this time.       // Brasilieiro e meu Sensei, obrigado man, por me aguentar todo esse tempo. //
//              Without him I wouldn't have made it this far.               //               Sem ele eu não teria chegado tão longe.                    //
//                                                                          //                                                                          //
//      This project uses as a basis the English translation done by        //         Essa projeto usa como base a tradução feita para o inglês        //
//                  RedComet, DarknessSavior and Tom.                       //              feita pelo RedComet, DarknessSavior e o Tom.                //
//    I really wanted to thank them for their work, without them I would    //         Queria muito agradecer ao trabalho deles, sem eles eu não        //
//                     not be working in that game.                         //                     estaria trabalho nesse jogo.                         //
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxx    Distribution of Patch Asm    xxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxx    Distribuição do Patch Asm    xxxxxxxxxxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//    In order to also help anyone who wants to take this game to their	    //    Com o objetivo de ajudar também quem desejar levar esse jogo para     //
//          native language, I am making this PATCH ASM available.			//       sua linguagem nátiva, estou disponíbilizando esse PATCH ASM.		//
//       I tried to make it as practical as possible, I also followed       //    Procurei deixar ele o mais prático possível, também seguimentei		//
//          a lot to try to make it easier for anyone to edit.				//   muita coisa para tentar deixar ele mais fácil pra qualquer pessoa		//
//           This is still an ongoing project, so a lot still				//    editar. Esse ainda é um projeto em andamento, então muita coisa       //
//                 needs to be done and also improved.                      //              precisa ser feita ainda e também melhorada.                 //
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------    SYSTEM ARCHITECTURE: Super Nintendo   -----------------	
//---------------   ARQUITETURA DO SISTEMA: Super Nintendo   ----------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    arch snes.cpu
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------  ROM TYPE: little-endian   -------------------------
//--------------------  TIPO DA ROM: little-endian  -------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    endian lsb
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//-----------------------  Patched ROM: atched.smc   ------------------------
//--------------------  ROM Patcheada: patcheada.smc   ----------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    output "DBZ-HD(BR)VWFNEW.sfc",create
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------------  Original ROM   -------------------------------
//---------------------------  ROM Original   -------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $00000000
	insert "DBZ-HD(JAPAN)VWF.sfc"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------------  Constants  ----------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    include "asm\Constantes.asm"
	include "asm\macro.asm"
    include "lib/snes.asm"                                     
    //include "lib/snes_header.asm"                           
    include "lib/snes_gfx.asm"                                
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------    VWF Table     ----------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $039c7d
	include "asm\vwf_table.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx		



//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//--------------  Splash Vila Oculta do Romhacking  -------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	//origin $007F11 // Rotina Original 
	//jml    $AA8000 // Desvio da Rotina
	//jml	   $00FF12 // Retorno para o Fluxo
	//origin $350000
	//insert "splash\splash.asm"
	
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	



//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------    Scripts     ------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx    Intro     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------   Script Bank   -----------------------------------
//--------------------   Banco dos Scripts   --------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $00066AB7 // Endereço da Instrução que muda o Banco convertido de PC para SNES
    lda #$00AE
	////origin $000CEAB7 // Endereço da Instrução que muda o Banco convertido de PC para SNES
    ////lda #$0060
	////origin $000CE39A // Endereço da Instrução que muda o Banco convertido de PC para SNES
    //lda $0000,y
	//cpy $8BB4
	//beq carrega_a0
	//rts
	//carrega_a0:	 
	//lda #$00A0
	//rts
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Pointers of Pointers Table   ---------------------------
//--------------   Ponteiro da Tabela de Ponteiros    -----------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $00066AC4 // Endereço da Tabela convertido de PC para SNES
	lda $AE8000,x // Instrução que carrega o endereço
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxxxxxx    History    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------  Pointers Table History Mode  --------------------------
//---------------  Tabela Ponteiros do Modo História  -----------------------
    origin $370000 
    include "asm\pointers_hystory_mode.asm"
    include "asm\pointers_vs_end_battle.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------   Script History Mode   -----------------------------
//-------------------   Script do modo História   ---------------------------
	origin $370200
    include "scripts_ptbr\history.asm"
//---------------  Script End of Battle in Versus Mode  ---------------------
//-------------  Script do Fim da Batalho no Modo Versus   ------------------
    include "scripts_ptbr\vs_end_battle.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Versus Mode Options     xxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------   Pointers Table of Versus Mode Options   --------------------
//---------   Tabela Ponteiros das Opções do Modo Versus   ------------------
    origin $0661ED 
    include "asm\pointers_menu_versus_mode.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Script of Versus Mode Options   ------------------------
//---------------   Script das Opções do Modo Versus   ----------------------
	origin $030520//03007A	
	include "scripts_ptbr\menu_versus_mode.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxx    Versus Mode Configuration     xxxxxxxxxxxxxxxxxxxxxxxx
//---------   Table of Versus Mode Configuration Pointers   -----------------
//------   Tabela de Ponteiros da Configuração do Modo Versus   -------------
    origin $0661EF 
    include "asm\pointers_vs_mode_configuration.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------   Script of Versus Mode Configuration   --------------------
//-------------   Script da Configuração do Modo Versus   -------------------
	origin $030570//0300AA	
	include "scripts_ptbr\vs_mode_configuration.asm"	
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Menu Title Screen     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------   Title Screen Menu Pointers Table   ------------------------
//-----------  Tabela Ponteiros do Menu da Tela Título   --------------------
    origin $0661EB 
    include "asm\pointers_menu_title_screen.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------   Script Menu Title Screen   ----------------------------
//---------------   Script do Menu da Tela Título   -------------------------
	origin $030480//030000	
	include "scripts_ptbr\menu_title_screen.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx    Options     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Options Mode Pointers Table   --------------------------
//---------------  Tabela Ponteiros do Modo Opções   ------------------------
    origin $010B7A
    include "asm\pointers_option.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------------   Script Options Mode   ------------------------------
//-------------------   Script do Modo Opções   -----------------------------
	origin $010B1E	
	include "scripts_ptbr\option.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------   Soundtrack Pointers Table   --------------------------
//---------------  Tabela Ponteiros da Trilha Sonora   ----------------------
	origin $010B8C 
    include "asm\pointers_soundtrack_menu.asm"
	origin $013e5e 
    include "asm\pointers_soundtrack_menu.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   Script Soundtrack   -------------------------------
//------------------   Script da Trilha Sonora   ----------------------------
	origin $3746C0//---$010BB4---Eendereço Original
	include "scripts_ptbr\soundtrack_menu.asm"	
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Tournament Mode Menu     xxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------  Tournament Mode Menu Pointers Table  ---------------------
//----------  Tabela dos Ponteiros do Menu do Modo Torneio  -----------------
    origin $0661F1
    include "asm\pointers_menu_tournament.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------   Script of Tournament Mode   -------------------------
//-----------------   Script do Menu do Modo Torneio   ----------------------
	origin $030660	
	include "scripts_ptbr\menu_tournament.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Tournament Bracket     xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------  Table of Pointers of Tournament bracket  ---------------------
//----------  Tabela dos Ponteiros das Chaves do Torneio  -------------------
    origin $0661F3
    include "asm\pointers_tournament_bracket.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------   Script of Tournament bracket   --------------------------
//---------------   Script das Chaves do Torneio   --------------------------
	origin $0306C0	
	include "scripts_ptbr\tournament_bracket.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Continues     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------  Table of Pointers of Continues  ------------------------
//---------------  Tabela dos Ponteiros dos Continues  ----------------------
    origin $0661F9
    include "asm\pointers_continues.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   Script of Continues   -----------------------------
//---------------------   Script dos Continues   ----------------------------
	origin $030780	
	include "scripts_ptbr\continues.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Credits     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------  Table of Pointers of Credits  -------------------------
//---------------  Tabela dos Ponteiros dos Créditos  -----------------------
    //origin $03019A
    //include "asm\pointers_credits.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------   Script of Credits   ------------------------------
//---------------------   Script dos Créditos   -----------------------------
	origin $033E0E	
	include "scripts_ptbr\credits.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx






//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------    Graphics     ------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx    Names    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------------   Character Names    ---------------------------------	
//-----------------   Nomes dos Personagens    ------------------------------
    origin $E000
	insert "gfx_ptbr\names.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxx   Combat Status   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   WIN/LOOSE/DRAW   ----------------------------------	
//----------------   Vitórias/Derrotas/Empates   ----------------------------
    origin $D800
	insert "gfx_ptbr\win_lose_draw.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Font    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------  Character Table    --------------------------------	
//-------------------   Tabela de Caracteres    -----------------------------
    origin $03877b
	insert "gfx_ptbr\character_table.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	

//xxxxxxxxxxxxxxxxxxxxxxx    Options    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------------  BGM    ---------------------------------------	
//----------------------  Trilha Sonora  ------------------------------------
    origin $CC40
	insert "gfx_ptbr\bgm.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------------------  Effect  ---------------------------------------	
//--------------------------  Efeito  ---------------------------------------
    origin $C9E0
	insert "gfx_ptbr\effect.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------------  Blow Back  -------------------------------------	
//------------------------  Contragolpe  ------------------------------------
    origin $C760
	insert "gfx_ptbr\blow_back.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------------  Rush Battle  -----------------------------------	
//------------------------  Batalha Rápida  ---------------------------------
    origin $C4E0
	insert "gfx_ptbr\rush_battle.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------------  Stage Color  -----------------------------------	
//------------------------  Cor do Estágio  ---------------------------------
    origin $C240
	insert "gfx_ptbr\stage_color.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------------  BGM  ---------------------------------------	
//-----------------------------  SOM  ---------------------------------------
    origin $C000
	insert "gfx_ptbr\som.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	
	
//xxxxxxxxxxxxxxxxxxxxxxxxxx    Title    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------------  Título  -------------------------------------
    origin $77000
	insert "gfx_ptbr\title.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	

//xxxxxxxxxxxxxxxxxxxxxxxxxx    Names 2    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------------  Nomes 2  ------------------------------------
    origin $6000
	insert "gfx_ptbr\names2.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx   READY/FIGHT!   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------   PRONTOS/LUTEM!   --------------------------------
	origin $2ABCA9
	insert "gfx_ptbr\ready.bin"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	





//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------------   Detour   ------------------------------------
//---------------------------   Desvios   -----------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//--------------   Deviation from Hyper Dimension Chart     -----------------
//---------------   Desvio do Gráfico Hyper Dimension     -------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $010134  // Endereço de Origem do Desvio Convertido do Endereço SNES
  	jml    $A18000  // Desvio
	
	origin $302000  // <-- DMA SRC
hyperdiminension_grafico:
	insert "gfx_ptbr\hyper_dimension.bin"
hyperdiminension_grafico_end:

    origin $308000
	include "asm\hyper_dimension.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//--------------   Deviation from P1 and P2     -----------------
//---------------   Desvio do Gráfico Hyper Dimension     -------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//    origin $011F5D  // Endereço de Origem do Desvio Convertido do Endereço SNES
//  	jml    $A1CE00  // Desvio
//	
//	origin $30CA00 // <-- DMA SRC
//p1_p2_grafico:
//	insert "gfx_ptbr\p1_p2.bin"
//p1_p2_grafico_end:
//
//    origin $30CE00
//	include "asm\p1_p2.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------   Ready and Fight!   -------------------------------
//-----------------------  Prontos e Lutem!   -------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//-------------   Deviation from Ready and Fight! Graph   -------------------
//--------------   Desvio dos Gráficos Prontos e Lutem!   -------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $0700DE
  	jml    $A0B400
	
	origin $302A00
ready_grafico:
	insert "gfx_ptbr\ready_fight.bin"
ready_grafico_end:

    origin $303400
	include "asm\ready.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------   READY Pointer   ---------------------------------
//--------------------   Ponteiro do PRONTOS   ------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $04BBA9
	dl $AF8000   
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------   Tilemap from Sprites READY   -------------------------
//------------------   Tilemap dos Sprites PRONTOS   ------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $378000
// [OPTS][Tile][Y][X]   [#]
	dd $103900D0     //-#00 Sprite 16X16 - P ---(BAIXO/LOW)
	dd $103B00E0     //-#02 Sprite 16X16 - RO --(BAIXO/LOW) 
	dd $003D00F0     //-#03 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $003E00F8     //-#05 Sprite  8x8  - N ---(BAIXO/LOW) 
	dd $003F0000     //-#06 Sprite  8x8  - NT --(BAIXO/LOW) 
	dd $00590008     //-#07 Sprite  8x8  - T ---(BAIXO/LOW) 
	dd $005A0010     //-#08 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $005B0018     //-#09 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $105C0020     //-#10 Sprite 16X16 - P ---(ALTO/HIGH)
	dd $1060F0D0     //-#17 Sprite 16X16 - P ---(ALTO/HIGH)
	dd $1062F0E0     //-#16 Sprite 16X16 - RO --(ALTO/HIGH)
	dd $1064F0F0     //-#15 Sprite 16X16 - ON --(ALTO/HIGH)
	dd $1066F000     //-#14 Sprite 16X16 - T ---(ALTO/HIGH)
	dd $1068F010     //-#13 Sprite 16X16 - O ---(ALTO/HIGH)
	dd $106AF020     //-#12 Sprite 16X16 - S ---(ALTO/HIGH)
//-----------------------END-----------------------------
	dd $49001880
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------  FIGHT! Pointer   ---------------------------------
//--------------------   Ponteiro do FIGHT!  --------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $04BBAC
	dl $AF8080   
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------   Tilemap from Sprites FIGHT   -------------------------
//------------------   Tilemap dos Sprites LUTEM!   -------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $378080
// [OPTS][Tile][Y][X]   [#]
	dd $005000E0     //-#00 Sprite  8x8  - L ---(BAIXO/LOW)
	dd $005100E8     //-#01 Sprite  8x8  - LU --(BAIXO/LOW)
	dd $005200F0     //-#02 Sprite  8x8  - U ---(BAIXO/LOW)
	dd $005300F8     //-#03 Sprite  8x8  - T ---(BAIXO/LOW)
	dd $00540000     //-#04 Sprite  8x8  - TE --(BAIXO/LOW)
	dd $00550008     //-#05 Sprite  8x8  - EM --(BAIXO/LOW)
	dd $00560010     //-#06 Sprite  8x8  - M ---(BAIXO/LOW)
	dd $00570018     //-#07 Sprite  8x8  - M ---(BAIXO/LOW)
	dd $00580020     //-#08 Sprite  8x8  - ! ---(BAIXO/LOW)
	dd $0048F820     //-#09 Sprite  8x8  - ! ---(BAIXO/LOW)
	dd $0038F020     //-#10 Sprite  8x8  - ! ---(BAIXO/LOW)
	dd $1030F0E0     //-#11 Sprite 16X16 - LU --(ALTO/HIGH)
	dd $1032F0F0     //-#12 Sprite 16X16 - UT --(ALTO/HIGH)
	dd $1034F000     //-#13 Sprite 16X16 - E ---(ALTO/HIGH)
	dd $1036F010     //-#14 Sprite 16X16 - M ---(ALTO/HIGH)
//-----------------------END-----------------------------
	dd $73081480
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx




//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//----------------------------   K.O.   -------------------------------------
//--------------------------   Nocaute   ------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------------   K.O. Pointer   ---------------------------------
//------------------   Configuração do Nocaute   ----------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $04BBB2
	dl $AF8200
	origin $04BBB5
	dl $AF8200
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------   Tilemap from Sprites K.O.   ---------------------------
//-----------------   Tilemap dos Sprites NOCAUTE   -------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $378200
// [OPTS][Tile][Y][X]   [#]
	dd $1030F8D4 // #00 Sprite 16x16 - N ---(ALTO/HIGH)
	dd $1032F8E4 // #01 Sprite 16x16 - O ---(ALTO/HIGH)
	dd $1034F8F4 // #02 Sprite 16x16 - A ---(ALTO/HIGH)
	dd $1036F804 // #03 Sprite 16x16 - U ---(ALTO/HIGH)
	dd $1038F814 // #04 Sprite 16x16 - T ---(ALTO/HIGH)
	dd $003AF824 // #05 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $004A0024 // #06 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $005A0824 // #07 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $005008D4 // #08 Sprite  8x8  - N ---(BAIXO/LOW) 
    dd $005108DC // #09 Sprite  8x8  - N ---(BAIXO/LOW)
	dd $005208E4 // #10 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $005308EC // #11 Sprite  8x8  - OC --(BAIXO/LOW)
	dd $005408F4 // #12 Sprite  8x8  - C ---(BAIXO/LOW)
	dd $005508FC // #13 Sprite  8x8  - A ---(BAIXO/LOW)
	dd $00560804 // #14 Sprite  8x8  - AU --(BAIXO/LOW) 
    dd $0057080C // #15 Sprite  8x8  - U ---(BAIXO/LOW)
	dd $00580814 // #16 Sprite  8x8  - T ---(BAIXO/LOW) 
	dd $0059081C // #17 Sprite  8x8  - TE --(BAIXO/LOW)
//-----------------------END-----------------------------
	dd $7CF40C80 
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx




//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//-------------------   Double K.O. Graph   ---------------------------------
//--------------------   Nocaute Duplo   ------------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------  Double K.O. Pointer   -----------------------------
//------------------   Ponteiro do Nocaute Duplo  ---------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $04BBAF
	dl $AF8300
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Tilemap from Sprites Double K.O.   ---------------------
//----------------   Tilemap dos Sprites NOCAUTE DUPLO   --------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $378300
//-----------------------K.O.----------------------------
//---------------------NOCAUTE---------------------------
// [OPTS][Tile][Y][X]   [#]
	dd $1030F8D4 // #00 Sprite 16x16 - N ---(ALTO/HIGH)
	dd $1032F8E4 // #01 Sprite 16x16 - O ---(ALTO/HIGH)
	dd $1034F8F4 // #02 Sprite 16x16 - A ---(ALTO/HIGH)
	dd $1036F804 // #03 Sprite 16x16 - U ---(ALTO/HIGH)
	dd $1038F814 // #04 Sprite 16x16 - T ---(ALTO/HIGH)
	dd $003AF824 // #05 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $004A0024 // #06 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $005A0824 // #07 Sprite  8x8  - E ---(ALTO/HIGH)
	dd $005008D4 // #08 Sprite  8x8  - N ---(BAIXO/LOW) 
    dd $005108DC // #09 Sprite  8x8  - N ---(BAIXO/LOW)
	dd $005208E4 // #10 Sprite  8x8  - O ---(BAIXO/LOW) 
	dd $005308EC // #11 Sprite  8x8  - OC --(BAIXO/LOW)
	dd $005408F4 // #12 Sprite  8x8  - C ---(BAIXO/LOW)
	dd $005508FC // #13 Sprite  8x8  - A ---(BAIXO/LOW)
	dd $00560804 // #14 Sprite  8x8  - AU --(BAIXO/LOW) 
    dd $0057080C // #15 Sprite  8x8  - U ---(BAIXO/LOW)
	dd $00580814 // #16 Sprite  8x8  - T ---(BAIXO/LOW) 
	dd $0059081C // #17 Sprite  8x8  - TE --(BAIXO/LOW)
//----------------------DOUBLE---------------------------
//----------------------DUPLO----------------------------
	dd $106010D8 // #18 Sprite 16x16 - D -----(ALTO/HIGH)
	dd $106210E8 // #19 Sprite 16x16 - U -----(ALTO/HIGH)
	dd $106410F8 // #20 Sprite 16x16 - PL ----(ALTO/HIGH)
	dd $10661008 // #21 Sprite 16x16 - LO ----(ALTO/HIGH)
	dd $10681018 // #22 Sprite 16x16 - O -----(ALTO/HIGH)
	dd $006A1028 // #23 Sprite 16x16 - BLANK -(ALTO/HIGH)
	dd $007A1828 // #24 Sprite 16x16 - O -----(ALTO/HIGH)
	dd $103B20D8 // #25 Sprite 16x16 - D -----(BAIXO/LOW)
	dd $103D20E8 // #26 Sprite 16x16 - U -----(BAIXO/LOW)
	dd $003F20F8 // #27 Sprite  8x8  - P -----(BAIXO/LOW)
	dd $004F28F8 // #28 Sprite  8x8  - P -----(BAIXO/LOW)
	dd $105B2000 // #29 Sprite 16x16 - PL ----(BAIXO/LOW)
	dd $105D2010 // #30 Sprite 16x16 - O -----(BAIXO/LOW)
	dd $005F2020 // #31 Sprite  8x8  - O -----(BAIXO/LOW)
	dd $006F2820 // #32 Sprite  8x8  - O -----(BAIXO/LOW)
	dd $007B2028 // #33 Sprite  8x8  - O -----(BAIXO/LOW)
	dd $007C2828 // #34 Sprite  8x8  - BLANK -(BAIXO/LOW)
//-----------------------END-----------------------------
	dd $30F8D480
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx



//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------   Deviation from Game Over Graph   ------------------------
//-----------------   Desvio do Gráfico Game Over   -------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $016758
  	jml    $A0C800
	
	origin $304000
game_over_grafico:
	insert "gfx_ptbr\game_over_2.bin"
game_over_grafico_end:

    origin $304800
	include "asm\game_over.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------   Tilemap Deviation from Game Over     --------------------
//----------------   Desvio do Tilemap do Game Over     ---------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//
//	  origin $01018A
//    jml    $A0E560
//    origin $306100
//endian msb
//tilemap_ready:
//insert "tilemap\game_over.bin"
//tilemap_ready_end:
//endian lsb
// origin $306560
//include "asm\tilemap_game_over.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------   Deviation from the Martial Arts Tournament Graphic   -----------
//-----------   Desvio do Gráfico Torneio de Artes Marciais   ---------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $070443
    jml    $A0BC00
	
	origin $303600
torneio_grafico:
	insert "gfx_ptbr\martial_arts_tournament.bin"
torneio_grafico_end:

    origin $303C00
	include "asm\martial_arts_tournament.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

