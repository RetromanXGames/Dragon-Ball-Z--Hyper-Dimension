//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxx    Project Information in English    xxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxx    Informações Sobre o Projeto em Português    xxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxxxxxxxxxxxx    Game    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxxxxx    Projeto    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//                      Game translation project:                           //                    Projeto de tradução do Jogo:                          //
//              Ganbare Goemon - Yuki hime Kyuushuutsu emaki                //              Ganbare Goemon - Yuki hime Kyuushuutsu emaki                //
//               of Super Nintendo for Brazilian Portuguese                 //              de Super Nintendo para o Português do Brasil                //
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//xxxxxxxxxxxxxxxxxxxxxxxxxxx    Thanks    xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx//xxxxxxxxxxxxxxxxxxxxxxxx    Agradecimentos    xxxxxxxxxxxxxxxxxxxxxxxxxxxx//
//--------------------------------------------------------------------------//--------------------------------------------------------------------------//
//    I have to thank Anime_World a lot, he is a Brazilian romhacker and    //     Eu tenhos que agradecer muito ao Anime_World, ele é um romhacker     //
//       my Sensei, thanks man, for putting up with me all this time.       // Brasilieiro e meu Sensei, obrigado man, por me aguentar todo esse tempo. //
//              Without him I wouldn't have made it this far.               //               Sem ele eu não teria chegado tão longe.                    //
//                                                                          //                                                                          //
//    I would also like to thank you for your great work on hacking and     //      Eu queria agradecer também ao grande trabalho no hacking e na       //
// translating this game through DDSTranslation, Tom, FlashPV, and Akira76. //   tradução desse jogo pelo DDSTranslation, Tom, FlashPV, e o Akira76.    //
//   Without their work, I would not have this project in progress today.   // Sem o trabalho deles eu não estaria hoje com esse projeto em andamento.  //
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
//--------------------       Constants        -------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    include "asm\Constantes.asm"
	include "asm\macro.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	


//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------------    VWF Table     ----------------------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    origin $039c7d
	include "asm\vwf_table.asm"
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
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Pointers of Pointers Table   ---------------------------
//--------------   Ponteiro da Tabela de Ponteiros    -----------------------
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
	origin $00066AC4 // Endereço da Tabela convertido de PC para SNES
	lda $AE8000,x // Instrução que carrega o endereço
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

	
//xxxxxxxxxxxxxxxxxxxxxxxx    History     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------   Pointers Table History Mode   ----------------------------
//------------   Tabela Ponteiros do Modo História   ------------------------
    origin $00370000 
    include "asm\pointers_hystory_mode.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx	
//---------------------   Script History Mode   -----------------------------
//-------------------   Script do modo História   ---------------------------
	origin $00370100
    include "spripts_ptbr\history1.asm"
	include "spripts_ptbr\history2.asm"
	include "spripts_ptbr\history3.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Menu Title Screen     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------   Title Screen Menu Pointers Table   ------------------------
//-----------  Tabela Ponteiros do Menu da Tela Título   --------------------
    origin $0003006E 
    include "asm\pointers_menu_title_screen.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------   Script Menu Title Screen   ----------------------------
//---------------   Script do Menu da Tela Título   -------------------------
	origin $00030000	
	include "spripts_ptbr\menu_title_screen.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Versus Mode Options     xxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------   Pointers Table of Versus Mode Options   --------------------
//---------   Tabela Ponteiros das Opções do Modo Versus   ------------------
    origin $0003009C 
    include "asm\pointers_menu_versus_mode.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Script of Versus Mode Options   ------------------------
//---------------   Script das Opções do Modo Versus   ----------------------
	origin $0003007A	
	include "spripts_ptbr\menu_versus_mode.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxx    Versus Mode Configuration     xxxxxxxxxxxxxxxxxxxxxxxx
//---------   Table of Versus Mode Configuration Pointers   -----------------
//------   Tabela de Ponteiros da Configuração do Modo Versus   -------------
    origin $0003019A 
    include "asm\pointers_vs_mode_configuration.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------   Script of Versus Mode Configuration   --------------------
//-------------   Script da Configuração do Modo Versus   -------------------
	origin $000300B5	
	include "spripts_ptbr\vs_mode_configuration.asm"	
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxx    Options     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------   Options Mode Pointers Table   --------------------------
//---------------  Tabela Ponteiros do Modo Opções   ------------------------
    origin $00010B7A
    include "asm\pointers_option.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//--------------------   Script Options Mode   ------------------------------
//-------------------   Script do Modo Opções   -----------------------------
	origin $00010B1E	
	include "spripts_ptbr\option.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------   Soundtrack Pointers Table   --------------------------
//---------------  Tabela Ponteiros da Trilha Sonora   ----------------------
	origin $00010B8A 
    include "asm\pointers_soundtrack_menu.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   Script Soundtrack   -------------------------------
//------------------   Script da Trilha Sonora   ----------------------------
	origin $00010BB4	
	include "spripts_ptbr\soundtrack_menu.asm"	
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Tournament Mode Menu     xxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------  Tournament Mode Menu Pointers Table  ---------------------
//----------  Tabela dos Ponteiros do Menu do Modo Torneio  -----------------
    origin $0003019A
    include "asm\pointers_menu_tournament.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-------------------   Script of Tournament Mode   -------------------------
//-----------------   Script do Menu do Modo Torneio   ----------------------
	origin $0003016A	
	include "spripts_ptbr\menu_tournament.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxx    Tournament Bracket     xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------  Table of Pointers of Tournament bracket  ---------------------
//----------  Tabela dos Ponteiros das Chaves do Torneio  ------------------
    origin $000302E6
    include "asm\pointers_tournament_bracket.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------   Script of Tournament bracket   --------------------------
//---------------   Script das Chaves do Torneio   --------------------------
	origin $000301CC	
	include "spripts_ptbr\tournament_bracket.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Continues     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//-----------------  Table of Pointers of Continues  ------------------------
//---------------  Tabela dos Ponteiros dos Continues  ----------------------
    origin $3019A
    include "asm\pointers_continues.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//---------------------   Script of Continues   -----------------------------
//---------------------   Script dos Continues   ----------------------------
	origin $00030276	
	include "spripts_ptbr\continues.asm"		
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx


//xxxxxxxxxxxxxxxxxxxxxxxxx    Credits     xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//------------------  Table of Pointers of Credits  -------------------------
//---------------  Tabela dos Ponteiros dos Créditos  -----------------------
    origin $0003019A
    include "asm\pointers_credits.asm"
//xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
//----------------------   Script of Credits   ------------------------------
//---------------------   Script dos Créditos   -----------------------------
	origin $00030276	
	include "spripts_ptbr\credits.asm"		
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
	
	
//--------------------------------------------------------------------	

//-- Desvio Hyper Dimension 
    origin $010134 // 
  	jml $A18000 // Desvio
	
	origin $302000  // <-- DMA SRC
hyperdiminension_grafico:
	insert "gfx_ptbr\hyper_dimension.bin"
hyperdiminension_grafico_end:

    origin $308000
	include "asm\hyper_dimension.asm"

//-------------------------------------------------------------------

//-- Desvio READY
    origin $0700DE // 
  	jml    $A0B400 // Desvio
	
	origin $302A00  // <-- DM
ready_grafico:
	insert "gfx_ptbr\ready.bin"
ready_grafico_end:

    origin $303400
	include "asm\ready.asm"

//------------------------------------------------------------------

////----------------------Rotina TIlemap Ready----------------------------
//
//	  origin $01018A // Endereço de Origem do Desvio Convertido do Endereço SNES
//    jml    $A0E560 // Desvio
//    origin $306100
//endian msb
//tilemap_ready:
//insert "tilemap\ready.bin"
//tilemap_ready_end:
//endian lsb
// origin $306560
//include "asm\tilemap_ready.asm"


//----------------------------Desvio Martial Arts Tournament--------------------------


//-- Desvio Torneio
    origin $0702E0 // Endereço de Origem do Desvio Convertido do Endereço SNES
  	jml    $A0BC00 // Desvio
	
	origin $303600  // <-- DM
torneio_grafico:
	insert "gfx_ptbr\martial_arts_tournament.bin"
torneio_grafico_end:

    origin $303C00
	include "asm\martial_arts_tournament.asm"

//------------------------------------------------------------------


//-- Desvio Logo
    origin $0100F0 // Endereço de Origem do Desvio Convertido do Endereço SNES
  	jml    $A0DE00 // Desvio
	
	origin $303E00  // <-- DM
logo_grafico:
	insert "gfx_ptbr\logo.bin"
logo_grafico_end:

	origin $305E00
include "asm\logo.asm"


//-------Rotina TIlemap-------

origin $01018A // Endereço de Origem do Desvio Convertido do Endereço SNES
  	jml    $A0E560 // Desvio


    origin $306100

endian msb
tilemap_grafico:
insert "tilemap\logo.bin"
tilemap_grafico_end:
endian lsb

	origin $306560
include "asm\tilemap_logo.asm"