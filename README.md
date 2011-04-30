Handlers
========

This gem allows you to use .md templates!

But wait! There's more!

This gem allows you to intersperse your markdown templates with erb!
The proper file extension for that is ".merb". *And*, if you don't
specify a filetype (simply "hello.merb" instead of "hello.html.merb"),
then your merb templates can compile to text and html! Which makes merb
fantastic for mailers.

And in fact, since it's so perfect for mailers, this gem also includes a
mailer generator, and sets it as the default. Who wants to maintain both
an html and text part of an email? Not me.
