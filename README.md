Calendar - Active Record & PostgreSQL
==============

by [Nuatu Tseggai] (https://github.com/nuatu) August 24, 2014
_______________

###About
Command line Ruby / Active Record / Postgres app for managing events, to-do's, and notes.
<ul>
<li>users can create and manage multiple events.</li>

<li>users can create and manage to-do's.</li>

<li>users can create and manage notes to associate with events or to-do's.</li>

*Event class includes multiple __scopes__.

*Note class includes use of __polymorphic association__ to expose 'doable' alias to events and to-do's.

</ul>

![Alt text](https://github.com/Nuatu/calendar_ar/blob/master/db_schema.png)

###Setup
Either clone this repository or download the .zip and run the 'ui.rb' file in your terminal.

###License
MIT
