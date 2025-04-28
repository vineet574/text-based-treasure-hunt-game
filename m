import java.util.*;

public class TreasureHunt {
    static char[][] map;
    static int playerRow = 0, playerCol = 0;
    static Random rand = new Random();

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        map = generateMap(5, 5); // 5x5 grid
        System.out.println("Welcome to Treasure Hunt!");
        System.out.println("Navigate using commands: UP, DOWN, LEFT, RIGHT.");
        System.out.println("Your goal: Find the treasure!");
        displayMap();

        while (true) {
            System.out.print("Enter command: ");
            String command = sc.nextLine().toUpperCase();
            if (!move(command)) {
                System.out.println("Invalid move. Try again!");
                continue;
            }
            if (map[playerRow][playerCol] == 'T') {
                System.out.println("Congratulations! You found the treasure!");
                break;
            } else if (map[playerRow][playerCol] == 'X') {
                System.out.println("Oh no! You fell into a trap. Game over!");
                break;
            } else {
                System.out.println("Keep searching...");
            }
            displayMap();
        }
        System.out.println("Thanks for playing!");
    }

    static char[][] generateMap(int rows, int cols) {
        char[][] map = new char[rows][cols];
        for (int i = 0; i < rows; i++) {
            for (int j = 0; j < cols; j++) {
                map[i][j] = '.';
            }
        }
        map[rand.nextInt(rows)][rand.nextInt(cols)] = 'T'; // Place treasure
        for (int i = 0; i < rows; i++) {
            map[rand.nextInt(rows)][rand.nextInt(cols)] = 'X'; // Place traps
        }
        return map;
    }

    static boolean move(String command) {
        int newRow = playerRow, newCol = playerCol;
        switch (command) {
            case "UP": newRow--; break;
            case "DOWN": newRow++; break;
            case "LEFT": newCol--; break;
            case "RIGHT": newCol++; break;
            default: return false;
        }
        if (newRow >= 0 && newRow < map.length && newCol >= 0 && newCol < map[0].length) {
            playerRow = newRow;
            playerCol = newCol;
            return true;
        }
        return false;
    }

    static void displayMap() {
        for (int i = 0; i < map.length; i++) {
            for (int j = 0; j < map[i].length; j++) {
                if (i == playerRow && j == playerCol) {
                    System.out.print("P "); // Player's position
                } else {
                    System.out.print(". ");
                }
            }
            System.out.println();
        }
    }
}
