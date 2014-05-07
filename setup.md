---
layout: lesson
root: .
title: Setup Instructions
---
These instructions are intended to help learners set up their computers.
Instructors should go through them *before* class starts.

<p>
  <strong>Warning:</strong> Setup instructions are currently set to a
  standard, "kitchen sink" default. Learners will not need all of the
  software listed below! The installation instructions will be
  winnowed down well in advance of the workshop.
</p>

<div class="row-fluid">
  <div class="span6">
    {% include setup/overview-bash.html %}
        {% include setup/linux-bash.html %}
        {% include setup/macosx-bash.html %}
        {% include setup/windows-bash.html %}
    {% include setup/overview-editor.html %}
        {% include setup/linux-editor.html %}
        {% include setup/macosx-editor.html %}
        {% include setup/windows-editor.html %}
    {% include setup/overview-git.html %}
        {% include setup/linux-git.html %}
        {% include setup/macosx-git.html %}
        {% include setup/windows-git.html %}
    {% include setup/overview-r.html %}
  </div>
  <div class="span6">
    {% include setup/overview-python.html %}
        {% include setup/linux-python.html %}
        {% include setup/macosx-python.html %}
        {% include setup/windows-python.html %} 
    {% include setup/overview-sqlite.html %}
        {% include setup/linux-sqlite.html %}     
        {% include setup/macosx-sqlite.html %} 
        {% include setup/windows-sqlite.html %}   
  </div>
</div>
