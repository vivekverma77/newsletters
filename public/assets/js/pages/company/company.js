$(function () {
    
    var table = $('#companies_table').DataTable({
        processing: true,
        serverSide: true,
        ajax: "/companies/get",
        columns: [
           // {data: 'DT_RowIndex', name: 'DT_RowIndex'},
            {data: 'id', name: 'id'},
            {data: 'company_name', name: 'company_name'},
            {data: 'domain', name: 'domain'},
            {data: 'email', name: 'email'},
            {data: 'tenancy_db_name', name: 'tenancy_db_name'},
            {data: 'created_at', name: 'created_at'},
            {
                data: 'action', 
                name: 'action', 
                orderable: false, 
                searchable: false
            },
        ]
    });
});
   