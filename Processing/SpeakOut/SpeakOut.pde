import guru.ttslib.*;

TTS tts;
ArrayList lines = new ArrayList();

void setup() {
  String[] rawLines = loadStrings( "diary.txt" );

  for ( int i=0; i<rawLines.length; i++) {
    if (!"".equals(rawLines[i])) {
      String[] tmp = rawLines[i].split("#");
      lines.add( new Line( tmp[0].trim() ));
    }
  }

  System.setProperty("mbrola.base", "/home/duerkop/Programme/mbrola/");
  tts = new TTS("mbrola_us1");
  tts.setPitch( 50 );
  tts.setPitchRange( 20 );
  tts.setPitchShift( 5.5 );
}

void draw() {
}

void mousePressed() {
  for (int i=0; i<lines.size(); i++) {
    Line l = (Line)lines.get(i);
    tts.speak(l.text);
  }
}

