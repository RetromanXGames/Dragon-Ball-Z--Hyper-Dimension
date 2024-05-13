    // INTRUCOES ORIGINAIS DE ONDE EU COLOQUEI O DESVIO
    jsl     $0CE16B

    cpx     #$0026
    beq     vs_tournament_1p
    bra     vs_tournament_retorno

vs_tournament_1p:

    phx 
    phy 
    pha 
       
    ldx     #($7040>>1)   // VRAM Dest* | endereço de destino do grafico na VRAM (aonde vou sobreescrever)
    stx     VDP_DATA
    
    lda     #$0001        // DMA Mode
    sta     REG_DMAP0
    lda     #$0018        // DMA Dest
    sta     REG_BBAD0
    ldx     #$E100        // DMA Src* | Endereço de SNES do gráfico na ROM
    stx     REG_A1T0L
    lda     #$00A0        // DMA Bank*| Banco de SNES do gráfico na ROM
    sta     REG_A1B0
    ldx     #(vs_tournament_1p_grafico_end-vs_tournament_1p_grafico)        // Size* | Tamanho do grafico FIM DO GRAFICO - INICIO DO GRAFICO
    stx     REG_DAS0L

    lda     #$0001        // DMA Start
    sta     REG_MDMAEN
	
    pla 
    ply 
    plx

vs_tournament_retorno:
    // RETORNO
    jml     $0CE277