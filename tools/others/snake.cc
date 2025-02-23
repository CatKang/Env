#include <ncurses.h>  // For ncurses library
#include <vector>
#include <cstdlib>
#include <ctime>

using namespace std;

// Function to generate random food position
pair<int, int> generateFood(const vector<pair<int, int>>& snake, int width, int height) {
    while (true) {
        int x = rand() % width + 1;
        int y = rand() % height + 1;
        bool overlap = false;
        for (const auto& s : snake) {
            if (s.first == x && s.second == y) {
                overlap = true;
                break;
            }
        }
        if (!overlap) return {x, y};
    }
}

int main() {
    srand(static_cast<unsigned>(time(0)));  // Seed for random number generation

    initscr();            // Initialize ncurses
    cbreak();             // Disable line buffering
    noecho();             // Disable echoing of input characters
    curs_set(0);          // Make cursor invisible
    nodelay(stdscr, TRUE); // Make getch() non-blocking

    const int width = 20;   // Board width
    const int height = 10;  // Board height

    vector<pair<int, int>> snake{{width / 2, height / 2}};  // Initial snake position
    pair<int, int> food = generateFood(snake, width, height);  // Generate initial food

    int dx = 1, dy = 0;  // Initial direction: Right
    int score = 0;

    while (true) {
        // Get user input
        int ch = getch();
        if (ch == KEY_UP && dy == 0) { dx = 0; dy = -1; }  // Up
        if (ch == KEY_DOWN && dy == 0) { dx = 0; dy = 1; } // Down
        if (ch == KEY_LEFT && dx == 0) { dx = -1; dy = 0; } // Left
        if (ch == KEY_RIGHT && dx == 0) { dx = 1; dy = 0; } // Right

        // Move the snake
        pair<int, int> head = snake.front();
        pair<int, int> newHead = {head.first + dx, head.second + dy};

        // Check for collision with walls or itself
        if (newHead.first <= 0 || newHead.first > width || newHead.second <= 0 || newHead.second > height) {
            endwin();  // End ncurses mode
            cout << "Game Over! Final Score: " << score << endl;
            return 0;
        }
        for (const auto& s : snake) {
            if (s == newHead) {
                endwin();  // End ncurses mode
                cout << "Game Over! Final Score: " << score << endl;
                return 0;
            }
        }

        // Add new head to the snake
        snake.insert(snake.begin(), newHead);

        // Check if the snake ate the food
        if (newHead == food) {
            food = generateFood(snake, width, height);  // Generate new food
            score += 10;  // Increase score
        } else {
            snake.pop_back();  // Remove tail if no food was eaten
        }

        // Draw the board
        clear();  // Clear screen
        for (int y = 0; y <= height + 1; ++y) {
            for (int x = 0; x <= width + 1; ++x) {
                if (x == 0 || x == width + 1 || y == 0 || y == height + 1) {
                    mvaddch(y, x, '#');  // Draw borders
                } else {
                    bool isSnake = false;
                    for (const auto& s : snake) {
                        if (s.first == x && s.second == y) {
                            mvaddch(y, x, 'O');  // Draw snake
                            isSnake = true;
                            break;
                        }
                    }
                    if (!isSnake) {
                        if (food.first == x && food.second == y) {
                            mvaddch(y, x, '*');  // Draw food
                        } else {
                            mvaddch(y, x, ' ');  // Empty space
                        }
                    }
                }
            }
        }
        mvprintw(0, width + 3, "Score: %d", score);  // Display score

        refresh();  // Refresh screen
        this_thread::sleep_for(chrono::milliseconds(100));  // Control game speed
    }

    endwin();  // End ncurses mode
    return 0;
}
