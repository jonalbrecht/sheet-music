%\version "2.18.0"

\header {
  title = "Superstition"
  composer = "Stevie Wonder"
}

% ====== Drum notations customized
#(define md '(
  (ridecymbal   cross    #f  5)(ridebell     xcircle  #f  5)
  (crashcymbal  cross    #f  6)(splashcymbal harmonic #f  6)
  (pedalhihat   cross    #f -5)(hihat        cross    #f  5)
  (snare        default  #f  1)(sidestick    cross    #f  1)
  (lowmidtom    default  #f  0)(lowtom       default  #f -1)
  (hightom      default  #f  3)(bassdrum     default  #f -3)
))

% ====== Custom open and half-open ornamentation
pth = #'((moveto 1 0.4) (lineto 0 -0.4))
hop = \markup{\hspace #0.5 \draw-circle #.4 #0.1 ##f}
hhop = \markup{ \combine \hop \path #0.1 #pth }
act = \markup {\left-align \musicglyph #"scripts.sforzato"}

% ===== Stems Up voice
up = \drummode { 
  % Customizations
  \stemUp
  \slurDown
  \numericTimeSignature
  
  % Tempo and rehearsal marks
  % \mark #1
  
  % Notes
  \mark "Drum Intro"
  r2 sn4 sn8[ sn16 sn] \bar "||"
  \set Score.currentBarNumber = #1
  hh8[ hh ^>] <hh sn>[ hh16 hh] hh[ hh hh8] <hh sn>[ hh16 hh] |
  hh8[ hh ^>] <hh sn>[ hh16 hh] hh8[ hh16 ^> hh] <hh sn>[ hh16 hh8] |
  hh8[ hh16 ^> hh] <hh sn>8[ hh16 hh] hh8[hh16 hh] <hh sn>16[ hh hh hh] |
  hh8[ hh ^>] <hh sn>[ hh16 hh] \mark "Keys Start" hh8[ hh ^>] <hh sn>16[ hh hh hh] |
  hh8[ hh ^>] <hh sn>[ hh16 hh] hh8[ hh16 hh] <hh sn>16[ hh hh hh] |
  hh8[ hh ^>] <hh sn>[ hh16 hh] hh8[ hh16 hh] <hh sn>16[ hh hh hh] |
  hh8[ hh16 ^> hh] <hh sn>8[ hh16 hh] hh8[hh16 hh] <hh sn>16[ hh hh hh] |
  hh8[ hh ^>] <hh sn>[ hh16 hh] hh8 sn8 sn16[ sn sn sn] |
  cymc8 hh8 <hh sn>8[ hh16 hh] hh8[hh16 hh] <hh sn>8[ hh] |
  hh8[ hh ^>] <hh sn>[ hh16 hh] hh8[ hh ^>] <hh sn>8[ sn16 sn] |
  hh8[ hh16 ^> hh] <hh sn>8[ hh16 hh] hh8[hh16 hh] <hh sn>8[ hh16 hh] |
  % \bar ":|."
}

% ===== Stems Down voice
down = \drummode { 
  % Customizations
  \stemDown
  
  % Notes
  s1 |
  bd4 bd bd bd |
  bd4 bd bd bd |
  bd4 bd bd bd |
  bd4 bd bd bd |
  bd4 bd bd bd |
  bd4 bd bd bd |
  bd4 bd bd bd |
  bd4 bd bd bd |
  bd4 bd8. bd16 bd4 bd8. bd16 |
  bd4 bd8. bd16 bd8. bd16 bd4 |
  bd8. bd16 bd8. bd16 bd8. bd16 bd8. bd16 |
}

% ====== Layout customizations
\score
{
  <<
    \set Score.markFormatter = #format-mark-circle-numbers
    \override Score.RehearsalMark #'X-offset = #0.5
    \new DrumStaff
    <<
      \set DrumStaff.drumStyleTable=#(alist->hash-table md)
      \new DrumVoice {\voiceOne \up}
      \new DrumVoice {\voiceTwo \down}
    >>
  >>
  
  \layout {\context {
%    \Score \remove "Bar_number_engraver"
    }
  }

	\midi {
		\context {
			\Score
			tempoWholesPerMinute = #(ly:make-moment 98 4)
		}
	}
}

% ===== Page customizations
\paper{
  #(set-paper-size "letter")
  %indent=#0
  line-width=#200
  oddFooterMarkup=##f
  oddHeaderMarkup=##f
  %bookTitleMarkup = ##f
  %scoreTitleMarkup = ##f
}
