# Google Java Style

Last changed: March 21, 2014

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<tbody>
<tr class="odd">
<td align="left"><dl>
<dt> <a href="#s1-introduction">1 Introduction</a> </dt>
<dd><a href="#s1.1-terminology">1.1 Terminology notes</a>
</dd>
<dd><a href="#s1.2-guide-notes">1.2 Guide notes</a>
</dd>
<dt> <a href="#s2-source-file-basics">2 Source file basics</a> </dt>
<dd><a href="#s2.1-file-name">2.1 File name</a>
</dd>
<dd><a href="#s2.2-file-encoding">2.2 File encoding: UTF-8</a>
</dd>
<dd><a href="#s2.3-special-characters">2.3 Special characters</a>
</dd>
<dd><a href="#s2.3.1-whitespace-characters">2.3.1 Whitespace characters</a>
</dd>
<dd><a href="#s2.3.2-special-escape-sequences">2.3.2 Special escape sequences</a>
</dd>
<dd><a href="#s2.3.3-non-ascii-characters">2.3.3 Non-ASCII characters</a>
</dd>
<dt> <a href="#s3-source-file-structure">3 Source file structure</a> </dt>
<dd><a href="#s3.1-copyright-statement">3.1 License or copyright information, if present</a>
</dd>
<dd><a href="#s3.2-package-statement">3.2 Package statement</a>
</dd>
<dd><a href="#s3.3-import-statements">3.3 Import statements</a>
</dd>
<dd><a href="#s3.3.1-wildcard-imports">3.3.1 No wildcard imports</a>
</dd>
<dd><a href="#s3.3.2-import-line-wrapping">3.3.2 No line-wrapping</a>
</dd>
<dd><a href="#s3.3.3-import-ordering-and-spacing">3.3.3 Ordering and spacing</a>
</dd>
<dd><a href="#s3.4-class-declaration">3.4 Class declaration</a>
</dd>
<dd><a href="#s3.4.1-one-top-level-class">3.4.1 Exactly one top-level class declaration</a>
</dd>
<dd><a href="#s3.4.2-class-member-ordering">3.4.2 Class member ordering</a>
</dd>
</dl></td>
<td align="left"><dl>
<dt> <a href="#s4-formatting">4 Formatting</a> </dt>
<dd><a href="#s4.1-braces">4.1 Braces</a>
</dd>
<dd><a href="#s4.1.1-braces-always-used">4.1.1 Braces are used where optional</a>
</dd>
<dd><a href="#s4.1.2-blocks-k-r-style">4.1.2 Nonempty blocks: K &amp; R style</a>
</dd>
<dd><a href="#s4.1.3-braces-empty-blocks">4.1.3 Empty blocks: may be concise</a>
</dd>
<dd><a href="#s4.2-block-indentation">4.2 Block indentation: +2 spaces</a>
</dd>
<dd><a href="#s4.3-one-statement-per-line">4.3 One statement per line</a>
</dd>
<dd><a href="#s4.4-column-limit">4.4 Column limit: 80 or 100</a>
</dd>
<dd><a href="#s4.5-line-wrapping">4.5 Line-wrapping</a>
</dd>
<dd><a href="#s4.5.1-line-wrapping-where-to-break">4.5.1 Where to break</a>
</dd>
<dd><a href="#s4.5.2-line-wrapping-indent">4.5.2 Indent continuation lines at least +4 spaces</a>
</dd>
<dd><a href="#s4.6-whitespace">4.6 Whitespace</a>
</dd>
<dd><a href="#s4.6.1-vertical-whitespace">4.6.1 Vertical Whitespace</a>
</dd>
<dd><a href="#s4.6.2-horizontal-whitespace">4.6.2 Horizontal whitespace</a>
</dd>
<dd><a href="#s4.6.3-horizontal-alignment">4.6.3 Horizontal alignment: never required</a>
</dd>
<dd><a href="#s4.7-grouping-parentheses">4.7 Grouping parentheses: recommended</a>
</dd>
<dd><a href="#s4.8-specific-constructs">4.8 Specific constructs</a>
</dd>
<dd><a href="#s4.8.1-enum-classes">4.8.1 Enum classes</a>
</dd>
<dd><a href="#s4.8.2-variable-declarations">4.8.2 Variable declarations</a>
</dd>
<dd><a href="#s4.8.3-arrays">4.8.3 Arrays</a>
</dd>
<dd><a href="#s4.8.4-switch">4.8.4 Switch statements</a>
</dd>
<dd><a href="#s4.8.5-annotations">4.8.5 Annotations</a>
</dd>
<dd><a href="#s4.8.6-comments">4.8.6 Comments</a>
</dd>
<dd><a href="#s4.8.7-modifiers">4.8.7 Modifiers</a>
</dd>
<dd><a href="#s4.8.8-numeric-literals">4.8.8 Numeric Literals</a>
</dd>
</dl></td>
<td align="left"><dl>
<dt> <a href="#s5-naming">5 Naming</a> </dt>
<dd><a href="#s5.1-identifier-names">5.1 Rules common to all identifiers</a>
</dd>
<dd><a href="#s5.2-specific-identifier-names">5.2 Rules by identifier type</a>
</dd>
<dd><a href="#s5.2.1-package-names">5.2.1 Package names</a>
</dd>
<dd><a href="#s5.2.2-class-names">5.2.2 Class names</a>
</dd>
<dd><a href="#s5.2.3-method-names">5.2.3 Method names</a>
</dd>
<dd><a href="#s5.2.4-constant-names">5.2.4 Constant names</a>
</dd>
<dd><a href="#s5.2.5-non-constant-field-names">5.2.5 Non-constant field names</a>
</dd>
<dd><a href="#s5.2.6-parameter-names">5.2.6 Parameter names</a>
</dd>
<dd><a href="#s5.2.7-local-variable-names">5.2.7 Local variable names</a>
</dd>
<dd><a href="#s5.2.8-type-variable-names">5.2.8 Type variable names</a>
</dd>
<dd><a href="#s5.3-camel-case">5.3 Camel case: defined</a>
</dd>
<dt> <a href="#s6-programming-practices">6 Programming Practices</a> </dt>
<dd><a href="#s6.1-override-annotation">6.1 @Override: always used</a>
</dd>
<dd><a href="#s6.2-caught-exceptions">6.2 Caught exceptions: not ignored</a>
</dd>
<dd><a href="#s6.3-static-members">6.3 Static members: qualified using class</a>
</dd>
<dd><a href="#s6.4-finalizers">6.4 Finalizers: not used</a>
</dd>
<dt> <a href="#s7-javadoc">7 Javadoc</a> </dt>
<dd><a href="#s7.1-javadoc-formatting">7.1 Formatting</a>
</dd>
<dd><a href="#s7.1.1-javadoc-multi-line">7.1.1 General form</a>
</dd>
<dd><a href="#s7.1.2-javadoc-paragraphs">7.1.2 Paragraphs</a>
</dd>
<dd><a href="#s7.1.3-javadoc-at-clauses">7.1.3 At-clauses</a>
</dd>
<dd><a href="#s7.2-summary-fragment">7.2 The summary fragment</a>
</dd>
<dd><a href="#s7.3-javadoc-where-required">7.3 Where Javadoc is used</a>
</dd>
<dd><a href="#s7.3.1-javadoc-exception-self-explanatory">7.3.1 Exception: self-explanatory methods</a>
</dd>
<dd><a href="#s7.3.2-javadoc-exception-overrides">7.3.2 Exception: overrides</a>
</dd>
</dl></td>
</tr>
</tbody>
</table>

## 1 Introduction [![](javaguidelink.png)](#s1-introduction)

This document serves as the **complete** definition of Google's coding standards for source code in the Java™ Programming Language. A Java source file is described as being *in Google Style* if and only if it adheres to the rules herein.

Like other programming style guides, the issues covered span not only aesthetic issues of formatting, but other types of conventions or coding standards as well. However, this document focuses primarily on the **hard-and-fast rules** that we follow universally, and avoids giving *advice* that isn't clearly enforceable (whether by human or tool).

### 1.1 Terminology notes [![](javaguidelink.png)](#s1.1-terminology)

In this document, unless otherwise clarified:

1.  The term *class* is used inclusively to mean an "ordinary" class, enum class, interface or annotation type (`@interface`).
2.  The term *comment* always refers to *implementation* comments. We do not use the phrase "documentation comments", instead using the common term "Javadoc."

Other "terminology notes" will appear occasionally throughout the document.

### 1.2 Guide notes [![](javaguidelink.png)](#s1.2-guide-notes)

Example code in this document is **non-normative**. That is, while the examples are in Google Style, they may not illustrate the *only* stylish way to represent the code. Optional formatting choices made in examples should not be enforced as rules.

## 2 Source file basics [![](javaguidelink.png)](#s2-source-file-basics)

### 2.1 File name [![](javaguidelink.png)](#s2.1-file-name)

The source file name consists of the case-sensitive name of the top-level class it contains, plus the `.java` extension.

### 2.2 File encoding: UTF-8 [![](javaguidelink.png)](#s2.2-file-encoding)

Source files are encoded in **UTF-8**.

### 2.3 Special characters [![](javaguidelink.png)](#s2.3-special-characters)

#### 2.3.1 Whitespace characters [![](javaguidelink.png)](#s2.3.1-whitespace-characters)

Aside from the line terminator sequence, the **ASCII horizontal space character** (**0x20**) is the only whitespace character that appears anywhere in a source file. This implies that:

1.  All other whitespace characters in string and character literals are escaped.
2.  Tab characters are **not** used for indentation.

#### 2.3.2 Special escape sequences [![](javaguidelink.png)](#s2.3.2-special-escape-sequences)

For any character that has a special escape sequence (`\b`, `\t`, `\n`, `\f`, `\r`, `\"`, `\'` and `\\`), that sequence is used rather than the corresponding octal (e.g. `\012`) or Unicode (e.g. `\u000a`) escape.

#### 2.3.3 Non-ASCII characters [![](javaguidelink.png)](#s2.3.3-non-ascii-characters)

For the remaining non-ASCII characters, either the actual Unicode character (e.g. `∞`) or the equivalent Unicode escape (e.g. `\u221e`) is used, depending only on which makes the code **easier to read and understand**.

**Tip:** In the Unicode escape case, and occasionally even when actual Unicode characters are used, an explanatory comment can be very helpful.

Examples:

| Example                                                        | Discussion                                                                |
|----------------------------------------------------------------|---------------------------------------------------------------------------|
| `String unitAbbrev = "μs";`                                    | Best: perfectly clear even without a comment.                             |
| `String unitAbbrev = "\u03bcs"; // "μs"`                       | Allowed, but there's no reason to do this.                                |
| `String unitAbbrev = "\u03bcs";       // Greek letter mu, "s"` | Allowed, but awkward and prone to mistakes.                               |
| `String unitAbbrev = "\u03bcs";`                               | Poor: the reader has no idea what this is.                                |
| `return '\ufeff' + content;        // byte order mark`         | Good: use escapes for non-printable characters, and comment if necessary. |

**Tip:** Never make your code less readable simply out of fear that some programs might not handle non-ASCII characters properly. If that should happen, those programs are **broken** and they must be **fixed**.

## 3 Source file structure [![](javaguidelink.png)](#s3-source-file-structure)

A source file consists of, **in order**:

1.  License or copyright information, if present
2.  Package statement
3.  Import statements
4.  Exactly one top-level class

**Exactly one blank line** separates each section that is present.

### 3.1 License or copyright information, if present [![](javaguidelink.png)](#s3.1-copyright-statement)

If license or copyright information belongs in a file, it belongs here.

### 3.2 Package statement [![](javaguidelink.png)](#s3.2-package-statement)

The package statement is **not line-wrapped**. The column limit (Section 4.4, [Column limit: 80 or 100](#s4.4-column-limit)) does not apply to package statements.

### 3.3 Import statements [![](javaguidelink.png)](#s3.3-import-statements)

#### 3.3.1 No wildcard imports [![](javaguidelink.png)](#s3.3.1-wildcard-imports)

**Wildcard imports**, static or otherwise, **are not used**.

#### 3.3.2 No line-wrapping [![](javaguidelink.png)](#s3.3.2-import-line-wrapping)

Import statements are **not line-wrapped**. The column limit (Section 4.4, [Column limit: 80 or 100](#s4.4-column-limit)) does not apply to import statements.

#### 3.3.3 Ordering and spacing [![](javaguidelink.png)](#s3.3.3-import-ordering-and-spacing)

Import statements are divided into the following groups, in this order, with each group separated by a single blank line:

1.  All static imports in a single group
2.  `com.google` imports (only if this source file is in the `com.google` package space)
3.  Third-party imports, one group per top-level package, in ASCII sort order
    -   for example: `android`, `com`, `junit`, `org`, `sun`

4.  `java` imports
5.  `javax` imports

Within a group there are no blank lines, and the imported names appear in ASCII sort order. (**Note:** this is not the same as the import *statements* being in ASCII sort order; the presence of semicolons warps the result.)

### 3.4 Class declaration [![](javaguidelink.png)](#s3.4-class-declaration)

#### 3.4.1 Exactly one top-level class declaration [![](javaguidelink.png)](#s3.4.1-one-top-level-class)

Each top-level class resides in a source file of its own.

#### 3.4.2 Class member ordering [![](javaguidelink.png)](#s3.4.2-class-member-ordering)

The ordering of the members of a class can have a great effect on learnability, but there is no single correct recipe for how to do it. Different classes may order their members differently.

What is important is that each class order its members in ***some* logical order**, which its maintainer could explain if asked. For example, new methods are not just habitually added to the end of the class, as that would yield "chronological by date added" ordering, which is not a logical ordering.

##### 3.4.2.1 Overloads: never split [![](javaguidelink.png)](#s3.4.2.1-overloads-never-split)

When a class has multiple constructors, or multiple methods with the same name, these appear sequentially, with no intervening members.

## 4 Formatting [![](javaguidelink.png)](#s4-formatting)

**Terminology Note:** *block-like construct* refers to the body of a class, method or constructor. Note that, by Section 4.8.3.1 on [array initializers](#s4.8.3.1-array-initializers), any array initializer *may* optionally be treated as if it were a block-like construct.

### 4.1 Braces [![](javaguidelink.png)](#s4.1-braces)

#### 4.1.1 Braces are used where optional [![](javaguidelink.png)](#s4.1.1-braces-always-used)

Braces are used with `if`, `else`, `for`, `do` and `while` statements, even when the body is empty or contains only a single statement.

#### 4.1.2 Nonempty blocks: K & R style [![](javaguidelink.png)](#s4.1.2-blocks-k-r-style)

Braces follow the Kernighan and Ritchie style ("[Egyptian brackets](http://www.codinghorror.com/blog/2012/07/new-programming-jargon.html)") for *nonempty* blocks and block-like constructs:

-   No line break before the opening brace.
-   Line break after the opening brace.
-   Line break before the closing brace.
-   Line break after the closing brace *if* that brace terminates a statement or the body of a method, constructor or *named* class. For example, there is *no* line break after the brace if it is followed by `else` or a comma.

Example:

``` prettyprint
return new MyClass() {
  @Override public void method() {
    if (condition()) {
      try {
        something();
      } catch (ProblemException e) {
        recover();
      }
    }
  }
};
```

A few exceptions for enum classes are given in Section 4.8.1, [Enum classes](#s4.8.1-enum-classes).

#### 4.1.3 Empty blocks: may be concise [![](javaguidelink.png)](#s4.1.3-braces-empty-blocks)

An empty block or block-like construct *may* be closed immediately after it is opened, with no characters or line break in between (`{}`), **unless** it is part of a *multi-block statement* (one that directly contains multiple blocks: `if/else-if/else` or `try/catch/finally`).

Example:

``` prettyprint
  void doNothing() {}
```

### 4.2 Block indentation: +2 spaces [![](javaguidelink.png)](#s4.2-block-indentation)

Each time a new block or block-like construct is opened, the indent increases by two spaces. When the block ends, the indent returns to the previous indent level. The indent level applies to both code and comments throughout the block. (See the example in Section 4.1.2, [Nonempty blocks: K & R Style](#s4.1.2-blocks-k-r-style).)

### 4.3 One statement per line [![](javaguidelink.png)](#s4.3-one-statement-per-line)

Each statement is followed by a line-break.

### 4.4 Column limit: 80 or 100 [![](javaguidelink.png)](#s4.4-column-limit)

Projects are free to choose a column limit of either 80 or 100 characters. Except as noted below, any line that would exceed this limit must be line-wrapped, as explained in Section 4.5, [Line-wrapping](#s4.5-line-wrapping).

**Exceptions:**

1.  Lines where obeying the column limit is not possible (for example, a long URL in Javadoc, or a long JSNI method reference).
2.  `package` and `import` statements (see Sections 3.2 [Package statement](#s3.2-package-statement) and 3.3 [Import statements](#s3.3-import-statements)).
3.  Command lines in a comment that may be cut-and-pasted into a shell.

### 4.5 Line-wrapping [![](javaguidelink.png)](#s4.5-line-wrapping)

**Terminology Note:** When code that might otherwise legally occupy a single line is divided into multiple lines, typically to avoid overflowing the column limit, this activity is called *line-wrapping*.

There is no comprehensive, deterministic formula showing *exactly* how to line-wrap in every situation. Very often there are several valid ways to line-wrap the same piece of code.

**Tip:** Extracting a method or local variable may solve the problem without the need to line-wrap.

#### 4.5.1 Where to break [![](javaguidelink.png)](#s4.5.1-line-wrapping-where-to-break)

The prime directive of line-wrapping is: prefer to break at a **higher syntactic level**. Also:

1.  When a line is broken at a *non-assignment* operator the break comes *before* the symbol. (Note that this is not the same practice used in Google style for other languages, such as C++ and JavaScript.)
    -   This also applies to the following "operator-like" symbols: the dot separator (`.`), the ampersand in type bounds (`<T extends Foo & Bar>`), and the pipe in catch blocks (`catch (FooException | BarException e)`).

2.  When a line is broken at an *assignment* operator the break typically comes *after* the symbol, but either way is acceptable.
    -   This also applies to the "assignment-operator-like" colon in an enhanced `for` ("foreach") statement.

3.  A method or constructor name stays attached to the open parenthesis (`(`) that follows it.
4.  A comma (`,`) stays attached to the token that precedes it.

#### 4.5.2 Indent continuation lines at least +4 spaces [![](javaguidelink.png)](#s4.5.2-line-wrapping-indent)

When line-wrapping, each line after the first (each *continuation line*) is indented at least +4 from the original line.

When there are multiple continuation lines, indentation may be varied beyond +4 as desired. In general, two continuation lines use the same indentation level if and only if they begin with syntactically parallel elements.

Section 4.6.3 on [Horizontal alignment](#s4.6.3-horizontal-alignment) addresses the discouraged practice of using a variable number of spaces to align certain tokens with previous lines.

### 4.6 Whitespace [![](javaguidelink.png)](#s4.6-whitespace)

#### 4.6.1 Vertical Whitespace [![](javaguidelink.png)](#s4.6.1-vertical-whitespace)

A single blank line appears:

1.  *Between* consecutive members (or initializers) of a class: fields, constructors, methods, nested classes, static initializers, instance initializers.
    -   <span class="exception">**Exception:** A blank line between two consecutive fields (having no other code between them) is optional. Such blank lines are used as needed to create *logical groupings* of fields.</span>

2.  Within method bodies, as needed to create *logical groupings* of statements.
3.  *Optionally* before the first member or after the last member of the class (neither encouraged nor discouraged).
4.  As required by other sections of this document (such as Section 3.3, [Import statements](#s3.3-import-statements)).

*Multiple* consecutive blank lines are permitted, but never required (or encouraged).

#### 4.6.2 Horizontal whitespace [![](javaguidelink.png)](#s4.6.2-horizontal-whitespace)

Beyond where required by the language or other style rules, and apart from literals, comments and Javadoc, a single ASCII space also appears in the following places **only**.

1.  Separating any reserved word, such as `if`, `for` or `catch`, from an open parenthesis (`(`) that follows it on that line
2.  Separating any reserved word, such as `else` or `catch`, from a closing curly brace (`}`) that precedes it on that line
3.  Before any open curly brace (`{`), with two exceptions:
    -   `@SomeAnnotation({a, b})` (no space is used)
    -   `String[][] x = {{"foo"}};` (no space is required between `{{`, by item 8 below)

4.  On both sides of any binary or ternary operator. This also applies to the following "operator-like" symbols:
    -   the ampersand in a conjunctive type bound: `<T extends Foo & Bar>`
    -   the pipe for a catch block that handles multiple exceptions: `catch (FooException | BarException e)`
    -   the colon (`:`) in an enhanced `for` ("foreach") statement

5.  After `,:;` or the closing parenthesis (`)`) of a cast
6.  On both sides of the double slash (`//`) that begins an end-of-line comment. Here, multiple spaces are allowed, but not required.
7.  Between the type and variable of a declaration: `List<String> list`
8.  *Optional* just inside both braces of an array initializer
    -   `new int[] {5, 6}` and `new int[] { 5, 6 }` are both valid

**Note:** This rule never requires or forbids additional space at the start or end of a line, only *interior* space.

#### 4.6.3 Horizontal alignment: never required [![](javaguidelink.png)](#s4.6.3-horizontal-alignment)

**Terminology Note:** *Horizontal alignment* is the practice of adding a variable number of additional spaces in your code with the goal of making certain tokens appear directly below certain other tokens on previous lines.

This practice is permitted, but is **never required** by Google Style. It is not even required to *maintain* horizontal alignment in places where it was already used.

Here is an example without alignment, then using alignment:

``` prettyprint
private int x; // this is fine
private Color color; // this too

private int   x;      // permitted, but future edits
private Color color;  // may leave it unaligned
```

**Tip:** Alignment can aid readability, but it creates problems for future maintenance. Consider a future change that needs to touch just one line. This change may leave the formerly-pleasing formatting mangled, and that is **allowed**. More often it prompts the coder (perhaps you) to adjust whitespace on nearby lines as well, possibly triggering a cascading series of reformattings. That one-line change now has a "blast radius." This can at worst result in pointless busywork, but at best it still corrupts version history information, slows down reviewers and exacerbates merge conflicts.

### 4.7 Grouping parentheses: recommended [![](javaguidelink.png)](#s4.7-grouping-parentheses)

Optional grouping parentheses are omitted only when author and reviewer agree that there is no reasonable chance the code will be misinterpreted without them, nor would they have made the code easier to read. It is *not* reasonable to assume that every reader has the entire Java operator precedence table memorized.

### 4.8 Specific constructs [![](javaguidelink.png)](#s4.8-specific-constructs)

#### 4.8.1 Enum classes [![](javaguidelink.png)](#s4.8.1-enum-classes)

After each comma that follows an enum constant, a line-break is optional.

An enum class with no methods and no documentation on its constants may optionally be formatted as if it were an array initializer (see Section 4.8.3.1 on [array initializers](#s4.8.3.1-array-initializers)).

``` prettyprint
private enum Suit { CLUBS, HEARTS, SPADES, DIAMONDS }
```

Since enum classes *are classes*, all other rules for formatting classes apply.

#### 4.8.2 Variable declarations [![](javaguidelink.png)](#s4.8.2-variable-declarations)

##### 4.8.2.1 One variable per declaration [![](javaguidelink.png)](#s4.8.2.1-variables-per-declaration)

Every variable declaration (field or local) declares only one variable: declarations such as `int a, b;` are not used.

##### 4.8.2.2 Declared when needed, initialized as soon as possible [![](javaguidelink.png)](#s4.8.2.2-variables-limited-scope)

Local variables are **not** habitually declared at the start of their containing block or block-like construct. Instead, local variables are declared close to the point they are first used (within reason), to minimize their scope. Local variable declarations typically have initializers, or are initialized immediately after declaration.

#### 4.8.3 Arrays [![](javaguidelink.png)](#s4.8.3-arrays)

##### 4.8.3.1 Array initializers: can be "block-like" [![](javaguidelink.png)](#s4.8.3.1-array-initializers)

Any array initializer may *optionally* be formatted as if it were a "block-like construct." For example, the following are all valid (**not** an exhaustive list):

``` prettyprint
new int[] {           new int[] {
  0, 1, 2, 3            0,
}                       1,
                        2,
new int[] {             3,
  0, 1,               }
  2, 3
}                     new int[]
                          {0, 1, 2, 3}
```

##### 4.8.3.2 No C-style array declarations [![](javaguidelink.png)](#s4.8.3.2-array-declarations)

The square brackets form a part of the *type*, not the variable: `String[] args`, not `String args[]`.

#### 4.8.4 Switch statements [![](javaguidelink.png)](#s4.8.4-switch)

**Terminology Note:** Inside the braces of a *switch block* are one or more *statement groups*. Each statement group consists of one or more *switch labels* (either `case FOO:` or `default:`), followed by one or more statements.

##### 4.8.4.1 Indentation [![](javaguidelink.png)](#s4.8.4.1-switch-indentation)

As with any other block, the contents of a switch block are indented +2.

After a switch label, a newline appears, and the indentation level is increased +2, exactly as if a block were being opened. The following switch label returns to the previous indentation level, as if a block had been closed.

##### 4.8.4.2 Fall-through: commented [![](javaguidelink.png)](#s4.8.4.2-switch-fall-through)

Within a switch block, each statement group either terminates abruptly (with a `break`, `continue`, `return` or thrown exception), or is marked with a comment to indicate that execution will or *might* continue into the next statement group. Any comment that communicates the idea of fall-through is sufficient (typically `// fall through`). This special comment is not required in the last statement group of the switch block. Example:

``` prettyprint
switch (input) {
  case 1:
  case 2:
    prepareOneOrTwo();
    // fall through
  case 3:
    handleOneTwoOrThree();
    break;
  default:
    handleLargeNumber(input);
}
```

##### 4.8.4.3 The default case is present [![](javaguidelink.png)](#s4.8.4.3-switch-default)

Each switch statement includes a `default` statement group, even if it contains no code.

#### 4.8.5 Annotations [![](javaguidelink.png)](#s4.8.5-annotations)

Annotations applying to a class, method or constructor appear immediately after the documentation block, and each annotation is listed on a line of its own (that is, one annotation per line). These line breaks do not constitute line-wrapping (Section 4.5, [Line-wrapping](#s4.5-line-wrapping)), so the indentation level is not increased. Example:

``` prettyprint
@Override
@Nullable
public String getNameIfPresent() { ... }
```

**Exception:** A *single* parameterless annotation *may* instead appear together with the first line of the signature, for example:

``` prettyprint
@Override public int hashCode() { ... }
```

Annotations applying to a field also appear immediately after the documentation block, but in this case, *multiple* annotations (possibly parameterized) may be listed on the same line; for example:

``` prettyprint
@Partial @Mock DataLoader loader;
```

There are no specific rules for formatting parameter and local variable annotations.

#### 4.8.6 Comments [![](javaguidelink.png)](#s4.8.6-comments)

##### 4.8.6.1 Block comment style [![](javaguidelink.png)](#s4.8.6.1-block-comment-style)

Block comments are indented at the same level as the surrounding code. They may be in `/* ... */` style or `// ...` style. For multi-line `/* ... */` comments, subsequent lines must start with `*` aligned with the `*` on the previous line.

``` prettyprint
/*
 * This is          // And so           /* Or you can
 * okay.            // is this.          * even do this. */
 */
```

Comments are not enclosed in boxes drawn with asterisks or other characters.

**Tip:** When writing multi-line comments, use the `/* ... */` style if you want automatic code formatters to re-wrap the lines when necessary (paragraph-style). Most formatters don't re-wrap lines in `// ...` style comment blocks.

#### 4.8.7 Modifiers [![](javaguidelink.png)](#s4.8.7-modifiers)

Class and member modifiers, when present, appear in the order recommended by the Java Language Specification:

    public protected private abstract static final transient volatile synchronized native strictfp

#### 4.8.8 Numeric Literals [![](javaguidelink.png)](#s4.8.8-numeric-literals)

`long`-valued integer literals use an uppercase `L` suffix, never lowercase (to avoid confusion with the digit `1`). For example, `3000000000L` rather than `3000000000l`.

## 5 Naming [![](javaguidelink.png)](#s5-naming)

### 5.1 Rules common to all identifiers [![](javaguidelink.png)](#s5.1-identifier-names)

Identifiers use only ASCII letters and digits, and in two cases noted below, underscores. Thus each valid identifier name is matched by the regular expression `\w+` .

In Google Style special prefixes or suffixes, like those seen in the examples `name_`, `mName`, `s_name` and `kName`, are **not** used.

### 5.2 Rules by identifier type [![](javaguidelink.png)](#s5.2-specific-identifier-names)

#### 5.2.1 Package names [![](javaguidelink.png)](#s5.2.1-package-names)

Package names are all lowercase, with consecutive words simply concatenated together (no underscores). For example, `com.example.deepspace`, not `com.example.deepSpace` or `com.example.deep_space`.

#### 5.2.2 Class names [![](javaguidelink.png)](#s5.2.2-class-names)

Class names are written in [UpperCamelCase](#s5.3-camel-case).

Class names are typically nouns or noun phrases. For example, `Character` or `ImmutableList`. Interface names may also be nouns or noun phrases (for example, `List`), but may sometimes be adjectives or adjective phrases instead (for example, `Readable`).

There are no specific rules or even well-established conventions for naming annotation types.

*Test* classes are named starting with the name of the class they are testing, and ending with `Test`. For example, `HashTest` or `HashIntegrationTest`.

#### 5.2.3 Method names [![](javaguidelink.png)](#s5.2.3-method-names)

Method names are written in [lowerCamelCase](#s5.3-camel-case).

Method names are typically verbs or verb phrases. For example, `sendMessage` or `stop`.

Underscores may appear in JUnit *test* method names to separate logical components of the name. One typical pattern is `test<MethodUnderTest>_<state>`, for example `testPop_emptyStack`. There is no One Correct Way to name test methods.

#### 5.2.4 Constant names [![](javaguidelink.png)](#s5.2.4-constant-names)

Constant names use `CONSTANT_CASE`: all uppercase letters, with words separated by underscores. But what *is* a constant, exactly?

Every constant is a static final field, but not all static final fields are constants. Before choosing constant case, consider whether the field really *feels like* a constant. For example, if any of that instance's observable state can change, it is almost certainly not a constant. Merely *intending* to never mutate the object is generally not enough. Examples:

``` prettyprint
// Constants
static final int NUMBER = 5;
static final ImmutableList<String> NAMES = ImmutableList.of("Ed", "Ann");
static final Joiner COMMA_JOINER = Joiner.on(',');  // because Joiner is immutable
static final SomeMutableType[] EMPTY_ARRAY = {};
enum SomeEnum { ENUM_CONSTANT }

// Not constants
static String nonFinal = "non-final";
final String nonStatic = "non-static";
static final Set<String> mutableCollection = new HashSet<String>();
static final ImmutableSet<SomeMutableType> mutableElements = ImmutableSet.of(mutable);
static final Logger logger = Logger.getLogger(MyClass.getName());
static final String[] nonEmptyArray = {"these", "can", "change"};
```

These names are typically nouns or noun phrases.

#### 5.2.5 Non-constant field names [![](javaguidelink.png)](#s5.2.5-non-constant-field-names)

Non-constant field names (static or otherwise) are written in [lowerCamelCase](#s5.3-camel-case).

These names are typically nouns or noun phrases. For example, `computedValues` or `index`.

#### 5.2.6 Parameter names [![](javaguidelink.png)](#s5.2.6-parameter-names)

Parameter names are written in [lowerCamelCase](#s5.3-camel-case).

One-character parameter names should be avoided.

#### 5.2.7 Local variable names [![](javaguidelink.png)](#s5.2.7-local-variable-names)

Local variable names are written in [lowerCamelCase](#s5.3-camel-case), and can be abbreviated more liberally than other types of names.

However, one-character names should be avoided, except for temporary and looping variables.

Even when final and immutable, local variables are not considered to be constants, and should not be styled as constants.

#### 5.2.8 Type variable names [![](javaguidelink.png)](#s5.2.8-type-variable-names)

Each type variable is named in one of two styles:

-   A single capital letter, optionally followed by a single numeral (such as `E`, `T`, `X`, `T2`)
-   A name in the form used for classes (see Section 5.2.2, [Class names](#s5.2.2-class-names)), followed by the capital letter `T` (examples: `RequestT`, `FooBarT`).

### 5.3 Camel case: defined [![](javaguidelink.png)](#s5.3-camel-case)

Sometimes there is more than one reasonable way to convert an English phrase into camel case, such as when acronyms or unusual constructs like "IPv6" or "iOS" are present. To improve predictability, Google Style specifies the following (nearly) deterministic scheme.

Beginning with the prose form of the name:

1.  Convert the phrase to plain ASCII and remove any apostrophes. For example, "Müller's algorithm" might become "Muellers algorithm".
2.  Divide this result into words, splitting on spaces and any remaining punctuation (typically hyphens).
    -   *Recommended:* if any word already has a conventional camel-case appearance in common usage, split this into its constituent parts (e.g., "AdWords" becomes "ad words"). Note that a word such as "iOS" is not really in camel case *per se*; it defies *any* convention, so this recommendation does not apply.

3.  Now lowercase *everything* (including acronyms), then uppercase only the first character of:
    -   ... each word, to yield *upper camel case*, or
    -   ... each word except the first, to yield *lower camel case*

4.  Finally, join all the words into a single identifier.

Note that the casing of the original words is almost entirely disregarded. Examples:

<table>
<colgroup>
<col width="33%" />
<col width="33%" />
<col width="33%" />
</colgroup>
<thead>
<tr class="header">
<th align="left">Prose form</th>
<th align="left">Correct</th>
<th align="left">Incorrect</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="left">&quot;XML HTTP request&quot;</td>
<td align="left"><code class="prettyprint lang-java">XmlHttpRequest</code></td>
<td align="left"><code class="badcode">XMLHTTPRequest</code></td>
</tr>
<tr class="even">
<td align="left">&quot;new customer ID&quot;</td>
<td align="left"><code class="prettyprint lang-java">newCustomerId</code></td>
<td align="left"><code class="badcode">newCustomerID</code></td>
</tr>
<tr class="odd">
<td align="left">&quot;inner stopwatch&quot;</td>
<td align="left"><code class="prettyprint lang-java">innerStopwatch</code></td>
<td align="left"><code class="badcode">innerStopWatch</code></td>
</tr>
<tr class="even">
<td align="left">&quot;supports IPv6 on iOS?&quot;</td>
<td align="left"><code class="prettyprint lang-java">supportsIpv6OnIos</code></td>
<td align="left"><code class="badcode">supportsIPv6OnIOS</code></td>
</tr>
<tr class="odd">
<td align="left">&quot;YouTube importer&quot;</td>
<td align="left"><code class="prettyprint lang-java">YouTubeImporter</code><br />
<code class="prettyprint lang-java">YoutubeImporter</code>*</td>
<td align="left"></td>
</tr>
</tbody>
</table>

\*Acceptable, but not recommended.

**Note:** Some words are ambiguously hyphenated in the English language: for example "nonempty" and "non-empty" are both correct, so the method names `checkNonempty` and `checkNonEmpty` are likewise both correct.

## 6 Programming Practices [![](javaguidelink.png)](#s6-programming-practices)

### 6.1 @Override: always used [![](javaguidelink.png)](#s6.1-override-annotation)

A method is marked with the `@Override` annotation whenever it is legal. This includes a class method overriding a superclass method, a class method implementing an interface method, and an interface method respecifying a superinterface method.

**Exception:**`@Override` may be omitted when the parent method is `@Deprecated`.

### 6.2 Caught exceptions: not ignored [![](javaguidelink.png)](#s6.2-caught-exceptions)

Except as noted below, it is very rarely correct to do nothing in response to a caught exception. (Typical responses are to log it, or if it is considered "impossible", rethrow it as an `AssertionError`.)

When it truly is appropriate to take no action whatsoever in a catch block, the reason this is justified is explained in a comment.

``` prettyprint
try {
  int i = Integer.parseInt(response);
  return handleNumericResponse(i);
} catch (NumberFormatException ok) {
  // it's not numeric; that's fine, just continue
}
return handleTextResponse(response);
```

**Exception:** In tests, a caught exception may be ignored without comment *if* it is named `expected`. The following is a very common idiom for ensuring that the method under test *does* throw an exception of the expected type, so a comment is unnecessary here.

``` prettyprint
try {
  emptyStack.pop();
  fail();
} catch (NoSuchElementException expected) {
}
```

### 6.3 Static members: qualified using class [![](javaguidelink.png)](#s6.3-static-members)

When a reference to a static class member must be qualified, it is qualified with that class's name, not with a reference or expression of that class's type.

``` prettyprint
Foo aFoo = ...;
Foo.aStaticMethod(); // good
aFoo.aStaticMethod(); // bad
somethingThatYieldsAFoo().aStaticMethod(); // very bad
```

### 6.4 Finalizers: not used [![](javaguidelink.png)](#s6.4-finalizers)

It is **extremely rare** to override `Object.finalize`.

**Tip:** Don't do it. If you absolutely must, first read and understand [*Effective Java*](http://books.google.com/books?isbn=8131726592) Item 7, "Avoid Finalizers," very carefully, and *then* don't do it.

## 7 Javadoc [![](javaguidelink.png)](#s7-javadoc)

### 7.1 Formatting [![](javaguidelink.png)](#s7.1-javadoc-formatting)

#### 7.1.1 General form [![](javaguidelink.png)](#s7.1.1-javadoc-multi-line)

The *basic* formatting of Javadoc blocks is as seen in this example:

``` prettyprint
/**
 * Multiple lines of Javadoc text are written here,
 * wrapped normally...
 */
public int method(String p1) { ... }
```

... or in this single-line example:

``` prettyprint
/** An especially short bit of Javadoc. */
```

The basic form is always acceptable. The single-line form may be substituted when there are no at-clauses present, and the entirety of the Javadoc block (including comment markers) can fit on a single line.

#### 7.1.2 Paragraphs [![](javaguidelink.png)](#s7.1.2-javadoc-paragraphs)

One blank line—that is, a line containing only the aligned leading asterisk (`*`)—appears between paragraphs, and before the group of "at-clauses" if present. Each paragraph but the first has `<p>` immediately before the first word, with no space after.

#### 7.1.3 At-clauses [![](javaguidelink.png)](#s7.1.3-javadoc-at-clauses)

Any of the standard "at-clauses" that are used appear in the order `@param`, `@return`, `@throws`, `@deprecated`, and these four types never appear with an empty description. When an at-clause doesn't fit on a single line, continuation lines are indented four (or more) spaces from the position of the `@`.

### 7.2 The summary fragment [![](javaguidelink.png)](#s7.2-summary-fragment)

The Javadoc for each class and member begins with a brief **summary fragment**. This fragment is very important: it is the only part of the text that appears in certain contexts such as class and method indexes.

This is a fragment—a noun phrase or verb phrase, not a complete sentence. It does **not** begin with `A {@code Foo} is a...`, or `This method returns...`, nor does it form a complete imperative sentence like `Save the record.`. However, the fragment is capitalized and punctuated as if it were a complete sentence.

**Tip:** A common mistake is to write simple Javadoc in the form `/** @return the customer ID */`. This is incorrect, and should be changed to `/** Returns the customer ID. */`.

### 7.3 Where Javadoc is used [![](javaguidelink.png)](#s7.3-javadoc-where-required)

At the *minimum*, Javadoc is present for every `public` class, and every `public` or `protected` member of such a class, with a few exceptions noted below.

Other classes and members still have Javadoc *as needed*. Whenever an implementation comment would be used to define the overall purpose or behavior of a class, method or field, that comment is written as Javadoc instead. (It's more uniform, and more tool-friendly.)

#### 7.3.1 Exception: self-explanatory methods [![](javaguidelink.png)](#s7.3.1-javadoc-exception-self-explanatory)

Javadoc is optional for "simple, obvious" methods like `getFoo`, in cases where there *really and truly* is nothing else worthwhile to say but "Returns the foo".

**Important:** it is not appropriate to cite this exception to justify omitting relevant information that a typical reader might need to know. For example, for a method named `getCanonicalName`, don't omit its documentation (with the rationale that it would say only `/** Returns the canonical name. */`) if a typical reader may have no idea what the term "canonical name" means!

#### 7.3.2 Exception: overrides [![](javaguidelink.png)](#s7.3.2-javadoc-exception-overrides)

Javadoc is not always present on a method that overrides a supertype method.

------------------------------------------------------------------------

Last changed: March 21, 2014
