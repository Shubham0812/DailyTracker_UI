
# Contributing Guidelines

First off, thanks for taking the time to contribute! ❤️


And if you like the project, but just don't have time to contribute, that's fine. 
There are other easy ways to support the project and show your appreciation, which we would also be very happy about:
> - Star the project
> - Tweet about it
> - Refer this project in your project's readme
> - Mention the project at local meetups and tell your friends/colleagues



## General
These are general guidelines when contributing to the project. These guidelines should help contributors understand which branch and how to structure these commits. 

### Branch Policy

 | Branch name | Description. |
|---|:--|
 | **main** |  After testing and reviewing merge conflicts the code will be merged into main. Before code can be merged into master it will go through a QA process. |
 | **Creating a branch** |  When creating a branch include the following: a description of the task and the issue ID e.g. _add-coredata-module-1337_. Hyphens should be used to seperate words. |

------------------

### Pull Requests
When contributing to the project there are some clear guidelines to follow:

**1. State the intent of the PR**

> State the intent of the pull request by using a meaningful description.


**2. Clearly describe what has changed**

Clearly describe the changes that have been made e.g.

> Refactored legacy code

❌ This does not describe what has changed, but rather sums up the ticket

> Refactored View X by removing unuseful comments and added factory methods to handle... _additional detail_

✅ This highlights the core changes and provides further detail to changes

**3. Add screenshots where necessary**

Sometimes front end UI changes may require screenshots. Use these at your leisure. 


#### Additional Points to be Kept in Mind

* Debug code should not be committed. If any code has to be modified for debug or QA testing purposes, make sure it is kept in the working tree only and not committed. If any **PR** contains any such changes, it shall be **__rejected__**. 

* Clean the code before raising a PR. Delete any unused code or files (instead of commenting out unused code), and rename the variables to be more relevant.  

* While committing the code, review the changes that are going in that commit. It's better to make smaller commits for each small task and push changes only relevant to that task. 
 

---
### Issue resolution

All contributors are encouraged to add tickets where necessary. There are some boilerplate templates for bugs and features. Should you want to add a feature please run this past the project maintainers. 

There are two types of templates for issues:
1. Bug - an error
2. Feature - a set of functionality or enhancements

## Code Structuring 

> Code can only tell you __how__ the program works; comments can tell you __why__ it works. Remember that you write your code to be consumed by other programmers first.

### Code Styling
> Most of the Code Styling Guidelines can be found on Kodeco's Swift Style Guide. We'll be following that extensively.

>  [Kodeco Swift Style Guide](https://github.com/kodecocodes/swift-style-guide)


### Comments 
>Your Code Comment should reflect your understanding and solution to the problem for which you are writing this code {Objective, for flow and function level}

 #### What needs a comment?
   
   -   ViewModels
    -   Services
    -   Functions that perform logical operations
    -   Models
    -   Programmatic UI handling

#### Functional comments
-   Add features to development process.
-   Four groups of functional comment
    -   i) Diagnostic directives: 
    -   ii) Annotations: 
    -   iii) Bugfix notes:
    -   iv) Performance improvement notes

#### Explanatory comments
-   These comments summarize the code or to explain the programmer’s intent.
-   Should answer the question __Why__ instead of __What__.
-   Algorithm description: name, complexity, documentation
-   Workarounds.

### Comment Styles

#### 1. Single Line
`// returns the dynamic height for the cell`


#### 2. Multi Line
     * UIKit:
     * For static image format, this value is always 0.
     * For animated image format, 0 means infinite looping.
     
#### 3. Documentation

    /// Returns a random value within the specified range.
    ///
    /// Use this method to generate an integer within a specific range. 
    func random(in range: ClosedRange<Int>) -> Int 

#### 4. Procedure
    # Lists

    You can apply *italic*, **bold**, or `code` inline styles.

    ## Unordered Lists

    - Lists are great,
    - but perhaps don't nest;
    - Sub-list formatting...

      - ...isn't the best.

    ## Ordered Lists

    1. Ordered lists, too,
    2. for things that are sorted;
    3. Arabic numerals
    4. are the only kind supported.
