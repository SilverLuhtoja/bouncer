enum Direction { NULL, UP, DOWN, LEFT, RIGHT }

bool gameStarted = false;
bool isGameOver = false;
bool isWinner = false;

double ballX = 0.0;
double ballY = 0.0;
double ballSpeed = 0.0001;
Direction ballYDirection = Direction.DOWN;
Direction ballXDirection = Direction.NULL;

double playerX = 0.0;
double playerWidth = 0.5;
double playerStep = 0.01;
double playerSpeed = 0.0;

double firstBrickX = -1 + wallCap;
double firstBrickY = -0.9;
double brickWidth = 0.4;
double brickHeight = 0.04;
double brickCap = 0.02;
int numberOfBricksInRow = 5;
int numberOfRows = 6;

int brickCount = 0;
double wallCap = 0.5 *
    (2 -
        numberOfBricksInRow * brickWidth -
        (numberOfBricksInRow - 1) * brickCap);
