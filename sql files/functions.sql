
-- not used


/

drop function enable_trigger;

/

drop function disable_trigger;

/


create or replace function enable_trigger(triggerName IN user_triggers.trigger_name%type)
return boolean
IS
begin
EXECUTE IMMEDIATE 'ALTER trigger ' || triggerName || ' enable';
return true;
end;

/




create or replace function disable_trigger(triggerName IN varchar)
return boolean
IS
begin
EXECUTE IMMEDIATE 'ALTER trigger ' || triggerName || ' disable';
return true;
end;

/


