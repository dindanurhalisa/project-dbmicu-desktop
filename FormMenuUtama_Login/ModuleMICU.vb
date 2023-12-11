Imports System.Data.SqlClient
Module ModuleMICU
    Public conn As SqlConnection
    Public da As SqlDataAdapter
    Public ds As DataSet
    Public cmd As SqlCommand
    Public rd As SqlDataReader
    Public mydb As String

    Public Sub koneksi()
        mydb = "data source = LAPTOP-JED9U8O1\SQLEXPRESS; initial catalog=DB_MICU; integrated security = true"
        conn = New SqlConnection(mydb)
        If conn.State = ConnectionState.Closed Then conn.Open()
    End Sub
End Module