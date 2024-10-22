
<cfquery name="insert">
    insert into tasks
    (name)
    values
    ('#form.name#')
</cfquery>

<cflocation url="index.cfm" addToken="no">
