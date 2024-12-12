
<h1 align="center">
  <br>
  <a href="http://www.amitmerchant.com/electron-markdownify"><img src="https://github.com/ryuk4real/the-binding-of-UNICAL/blob/main/icon.png" alt="The Binding of Unical" width="200"></a>
  <br>
   The Binding of Unical
  <br>
</h1>

<h4 align="center">A 2D, roguelite game set in the University of Calabria that uses the <a href="https://godotengine.org/" target="_blank">Godot Engine</a> and a declarative approach for Procedural Content Generation.</h4>

<p align="center">
  <a href="https://godotengine.org/download/linux/">
    <img src="https://img.shields.io/badge/Godot-4.3-blue?logo=godotengine&logoColor=white">
  </a>

  <a href="https://github.com/alviano/gdatalog">
    <img src="https://img.shields.io/badge/GDatalog-0.3.6-white?style=flat">
  </a>

  <a href="https://www.python.org/downloads/release/python-380/">
    <img src="https://img.shields.io/badge/Python-%3E%3D3.11-blue?style=flat&logo=python&logoColor=white">
  </a>
  

</p>

<p align="center">
  <a href="#project-description">Project Description</a> •
  <a href="#how-to-use">How To Use</a> •
  <a href="#license">License</a>
</p>



https://github.com/user-attachments/assets/40c3bac5-2399-4fad-9d2f-415a1aa87f15



## Project Description

This project, developed as part of my **Bachelor's Degree thesis**, explores the implementation of a **2D**, **rouguelite** game in **Godot** that uses a **Python** implementation of **Generative Datalog** to create **procedural generated content**. The research aims to demonstrate the potential of Generative Datalog to simplify the content generation process while maintaining high-quality output. By utilizing this innovative approach, the thesis (and the projects) investigates how developers can specify content generation rules in a high-level, declarative manner that abstracts away the procedural complexities typically associated with game development. This abstraction allows developers to focus on defining the **what** of content generation rather than the **how**, which can lead to faster development cycles and reduced cognitive load. The comunication between Godot and GDatalog is made by a **FastAPI** server implemented in GDatalog.

## How To Use

To clone and run this application, you'll need [Git](https://git-scm.com) and the [Godot Engine v4.3](https://godotengine.org/download/linux/) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/ryuk4real/the-binding-of-UNICAL

# Open the cloned folder
$ cd the-binding-of-UNICAL

# Update the GDatalog submodule
$ git submodule update --init --recursive

# Enter in the gdatalog submiodule
$ cd gdatalog

# Run poetry to install all the dependancies (of course it must be already installed)
$ poetry install

# Now you can open and run the game inside the Godot Engine
```

> **Note**
> The game was implemented in Ubuntu 22.04, Godot 4.3 is totally supported by the main OS but it has been tesdted only on Linux, if you experience a bug, please, feel free to open an issue.

## License

GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007

