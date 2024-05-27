const assetPath = 'assets/rsp';

enum InputType{
  rock,
  scissors,
  paper;

  String get path => '$assetPath/$name.png';
}

enum Result{
  playerWin('Player Win'),
  draw('Draw'),
  cpuWin('Player Lose');

  final String displayString;
  const Result(this.displayString);
}