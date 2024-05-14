const assetPath = 'assets/images/rsp';

enum InputType{
  rock,
  scissors,
  paper;

  String get path => '$assetPath/$name.png';
}

enum Result{
  playerWin('Player win'),
  draw('Draw'),
  cpuWin('Player Lose');

  const Result(this.displayString);

  final String displayString;

}