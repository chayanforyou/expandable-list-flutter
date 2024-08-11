# Expandable List with Add/Delete Functionality in Flutter

This Flutter project demonstrates how to create an expandable list that initially displays a limited number of items, with the option to show more or less using a toggle button. Additionally, it includes functionality for adding new items to the list and deleting individual items.

## Features

- **Expandable List**: The list shows a specified number of items by default, with the option to show the entire list or collapse it.
- **Add New Item**: Add new items to the list dynamically using an "Add New Item" button.
- **Delete Item**: Each list item has a delete button, allowing the user to remove items individually.
- **Toggle View**: A "Show more" button appears when there are more items than initially shown. It toggles to "Show less" when the full list is displayed.

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your local machine.
- A code editor like [Visual Studio Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio).

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/chayanforyou/expandable-list-flutter.git
    ```
2. Navigate to the project directory:
    ```bash
    cd expandable-list-flutter
    ```
3. Get the dependencies:
    ```bash
    flutter pub get
    ```

### Running the App

1. Connect your device or start an emulator.
2. Run the app:
    ```bash
    flutter run
    ```

## Code Explanation

### Main Structure

The main functionality is implemented in `ListScreen` stateful widget.

- **List of Items**: The `items` list stores the list elements.
- **Initial Item Count**: The `initialItemCount` variable controls how many items are displayed before the "Show more" button appears.
- **Toggle Button**: The button toggles between "Show more" and "Show less," adjusting the number of visible items.
- **Adding Items**: New items are added dynamically to the list by pressing the "Add New Item" button.
- **Deleting Items**: Each item can be deleted by clicking the trash icon next to it.

### Key Widgets

- **ListView.builder**: Used for dynamically building the list based on the `items` list.
- **IconButton**: Provides the delete functionality for each list item.
- **TextButton**: Toggles between showing more or fewer items.
- **ElevatedButton**: Adds new items to the list.

## Customization

- **Change Initial Display Count**: Modify the `initialItemCount` variable to change how many items are shown by default.
- **Styling**: Customize the appearance of the buttons and list items by modifying the widgets.

## Contributing

Contributions are welcome! Please fork this repository, make your changes, and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Flutter Documentation](https://flutter.dev/docs)
- [Stack Overflow](https://stackoverflow.com) for community support