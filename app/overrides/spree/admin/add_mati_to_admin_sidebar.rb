Deface::Override.new(
    virtual_path: 'spree/admin/shared/_main_menu',
    name: 'mati_admin_sidebar_menu',
    insert_top: 'nav',
    partial: 'spree/admin/shared/mati_sidebar_menu'
  )