    // INTRUCOES ORIGINAIS DE ONDE EU COLOQUEI O DESVIO
    //jsr     $E91D
    ldx #$151C
    ldy #$0002
    lda #$0300
    phx 
    phy 
    pha 
    

    ldx     #($9600>>1)   // VRAM Dest* | endereço de destino do grafico na VRAM (aonde vou sobreescrever)
    stx     VDP_DATA
    
    lda     #$0001        // DMA Mode
    sta     REG_DMAP0
    lda     #$0018        // DMA Dest
    sta     REG_BBAD0
    ldx     #$C000        // DMA Src* | Endereço de SNES do gráfico na ROM
    stx     REG_A1T0L
    lda     #$00A0        // DMA Bank*| Banco de SNES do gráfico na ROM
    sta     REG_A1B0
    ldx     #(end_battle_grafico_end-end_battle_grafico)        // Size* | Tamanho do grafico FIM DO GRAFICO - INICIO DO GRAFICO
    stx     REG_DAS0L

    lda     #$0001        // DMA Start
    sta     REG_MDMAEN
	
    pla 
    ply 
    plx

    // RETORNO
    jml     $0CE897