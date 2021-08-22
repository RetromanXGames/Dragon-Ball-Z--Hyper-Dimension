HyperDimension:
    
    ldx     #($c000>>1)   // VRAM Dest*
    stx     VDP_DATA

    lda     #$0001        // DMA Mode
    sta     REG_DMAP0
    lda     #$0018        // DMA Dest
    sta     REG_BBAD0
    ldx     #$a000        // DMA Src* // Lugar na Rom onde a imagem foi inserida
    stx     REG_A1T0L
    lda     #$00A0        // DMA Bank*
    sta     REG_A1B0
    ldx     #(hyperdiminension_grafico_end-hyperdiminension_grafico)        // Size*
    stx     REG_DAS0L

    lda     #$0001        // DMA Start
    sta     REG_MDMAEN
	
	ldx #$0000
	stx $1a08
    jml $02813A