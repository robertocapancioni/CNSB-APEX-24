select null "level",
  ENTRY_TEXT label,
  ENTRY_TARGET target,
  ENTRY_TEXT image_alt_attribute,
  ENTRY_IMAGE CARD_INITIALS,
  '<img src="' || ENTRY_IMAGE || '"/>'  attribute3
  from APEX_APPLICATION_LIST_ENTRIES 
 where application_name = 'D10.1 Applicazione 1'
   and list_name='Menu di navigazione'
   and parent_entry_text='Sezione 1'
 order by display_sequence
