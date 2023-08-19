#Demo

https://github.com/kodekarim/bookAppTest/assets/13949425/3df1d529-ddf5-4e06-909c-d0498c750a3b



# Project Description:

The project follows an MVVM-C (Model-View-ViewModel-Coordinator) architectural pattern. This architecture provides a clear separation between the data and presentation layers, facilitated by the Model, View, and ViewModel components. The Coordinator is responsible for orchestrating the navigation across all application screens.

Comprehensive unit test coverage has been incorporated into the project, with a test case coverage percentage of 34.6. This proactive approach to testing enhances the reliability and stability of the application.

The project encompasses two primary screens and two subsidiary screens, organized as follows:

**Main Screens:**
1. **Upload Screen:**
   Serving as the application's homepage, the Upload Screen enables users to upload text files. A "Read" button is available for users to seamlessly transition to the Read Screen.

2. **Read Screen:**
   The Read Screen leverages a UIPageViewController to present content. Upon sharing the selected text file from the Upload Screen, the string undergoes filtering and segmentation. Each segment consists of a maximum of 200 words. The pagination logic dynamically adjusts the number of pages within the PageViewController.

**Sub Screens:**
1. **Edit Screen:**
   This sub screen introduces a user-friendly "Edit" button. Upon interaction, a discreet bottom sheet emerges. Users can fine-tune their reading experience by customizing font size and line spacing.

2. **SinglePage Screen:**
   The SinglePage screen is crucial for rendering the text content. Utilizing swiping gestures, users can fluidly navigate through the text. Each individual portion of text is encapsulated within a SinglePage component.

In summary, the project seamlessly integrates MVVM-C architecture to ensure effective data management and presentation. With two principal screens – Upload and Read – as well as two supplementary screens – Edit and SinglePage – the application's structure and functionality are meticulously designed to provide users with a coherent and gratifying reading experience.
