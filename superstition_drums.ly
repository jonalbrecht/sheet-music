\version "2.18.0"
\header {
  title = "Superstition"
  composer = "Stevie Wonder"
}

#(define mydrums '(
                    ( ridecymbal    cross    #f   5)	
                    ( ridecymbala   xcircle  #f   5)
                    ( crashcymbal   cross    #f   6)	
                    ( splashcymbal  harmonic #f   6)
                    ( pedalhihat    cross    #f  -5)	
                    ( hihat         cross    #f   5)
                    ( snare         default  #f   1)	
                    ( sidestick     cross    #f   1)
                    ( lowmidtom     default  #f   0)	
                    ( lowtom        default  #f  -1)
                    ( hightom       default  #f   3)	
                    ( bassdrum      default  #f  -3)))

up = \drummode { 
  \stemUp
  r2 sn4 sn8[ sn16 sn] |
  hh8[ hh] <hh sn>[ hh16 hh] hh[ hh hh8] <hh sn>[ hh16 hh]
}

down = \drummode { 
  r1 |
  bd4 bd bd bd
}

\score { << \new DrumStaff <<
\set DrumStaff.drumStyleTable = #(alist->hash-table mydrums)
  \new DrumVoice { \voiceOne \up }
  \new DrumVoice { \voiceTwo \down }
>> >> }