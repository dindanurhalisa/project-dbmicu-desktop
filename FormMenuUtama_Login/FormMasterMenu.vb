Imports System.Data.SqlClient
Public Class FormMasterMenu

    Sub KondisiAwal()
        TextBox1.Text = ""
        TextBox2.Text = ""
        TextBox3.Text = ""
        TextBox4.Text = ""
        TextBox1.Enabled = False
        TextBox2.Enabled = False
        TextBox3.Enabled = False
        TextBox4.Enabled = False
        Button1.Text = "Input"
        Button2.Text = "Edit"
        Button3.Text = "Delete"
        Button4.Text = "Tutup"
        Button1.Enabled = True
        Button2.Enabled = True
        Button3.Enabled = True
        Button4.Enabled = True
        Call koneksi()
        da = New SqlDataAdapter("Select * from tbl_menu", conn)
        ds = New DataSet
        da.Fill(ds, "tbl_menu")
        DataGridView1.DataSource = (ds.Tables("tbl_menu"))
        TextBox1.MaxLength = 4
    End Sub

    Sub SiapIsi()
        TextBox1.Enabled = True
        TextBox2.Enabled = True
        TextBox3.Enabled = True
        TextBox4.Enabled = True
    End Sub

    Sub NoOtomatis()
        Call koneksi()
        cmd = New SqlCommand("Select * from tbl_menu where KodeMenu in (select max(KodeMenu) from tbl_menu)", conn)
        Dim urutankode As String
        Dim hitung As Long
        rd = cmd.ExecuteReader
        rd.Read()
        If Not rd.HasRows Then
            urutankode = "MK" + "01"
        Else
            hitung = Microsoft.VisualBasic.Right(rd.GetString(0), 2) + 1
            urutankode = "MK" + Microsoft.VisualBasic.Right("00" & hitung, 2)
        End If
        TextBox1.Text = urutankode
    End Sub

    Private Sub TextBox1_KeyPress(sender As Object, e As KeyPressEventArgs) Handles TextBox1.KeyPress
        If e.KeyChar = Chr(13) Then
            Call koneksi()
            cmd = New SqlCommand("Select * from tbl_menu where KodeMenu='" & TextBox1.Text & "'", conn)
            rd = cmd.ExecuteReader
            rd.Read()
            If rd.HasRows Then
                TextBox2.Text = rd.Item("NamaMenu")
                TextBox3.Text = rd.Item("HargaMenu")
                TextBox4.Text = rd.Item("StokMenu")
            Else
                MsgBox("Data Tidak Ada")
            End If
        End If
    End Sub

    Private Sub FormMasterBuku_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Call KondisiAwal()
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If Button1.Text = "Input" Then
            Button1.Text = "Simpan"
            Button2.Enabled = False
            Button3.Enabled = False
            Call SiapIsi()
            Call NoOtomatis()
            TextBox1.Enabled = False
            TextBox2.Focus()
        Else
            If TextBox1.Text = "" Or TextBox2.Text = "" Or TextBox3.Text = "" Or TextBox4.Text = "" Then
                MsgBox("Data belum lengkap, silahkan isi semua field!")
            Else
                Call koneksi()
                Dim simpandata As String = "insert into tbl_menu values ('" & TextBox1.Text & "', '" & TextBox2.Text & "', '" & TextBox3.Text & "', '" & TextBox4.Text & "')"
                cmd = New SqlCommand(simpandata, conn)
                cmd.ExecuteNonQuery()
                MsgBox("Data berhasil disimpan")
                Call KondisiAwal()
            End If
        End If
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        If Button2.Text = "Edit" Then
            Button2.Text = "Simpan"
            Button1.Enabled = False
            Button3.Enabled = False
            Button4.Text = "Batal"
            Call SiapIsi()
        Else
            If TextBox1.Text = "" Or TextBox2.Text = "" Or TextBox3.Text = "" Or TextBox4.Text = "" Then
                MsgBox("Data Belum Lengkap!, silahkan isi semua field")
            Else
                Call koneksi()
                Dim editdata As String = "update tbl_menu set NamaMenu='" & TextBox2.Text & "',HargaMenu='" & TextBox3.Text & "',StokMenu='" & TextBox4.Text & "' where KodeMenu='" & TextBox1.Text & "'"
                cmd = New SqlCommand(editdata, conn)
                cmd.ExecuteNonQuery()
                MsgBox("Data berhasil diubah")
                Call KondisiAwal()
            End If
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        If Button3.Text = "Delete" Then
            Button3.Text = "Simpan"
            Button1.Enabled = False
            Button2.Enabled = False
            Button4.Text = "Batal"
            Call SiapIsi()
        Else
            If TextBox1.Text = "" Or TextBox2.Text = "" Or TextBox3.Text = "" Or TextBox4.Text = "" Then
                MsgBox("Data Belum Lengkap!, silahkan isi semua field")
            Else
                Call koneksi()
                Dim hapusdata As String = "delete tbl_menu where KodeMenu='" & TextBox1.Text & "'"
                cmd = New SqlCommand(hapusdata, conn)
                cmd.ExecuteNonQuery()
                MsgBox("Data berhasil dihapus")
                Call KondisiAwal()
            End If
        End If
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        If Button4.Text = "Tutup" Then
            Me.Close()
        Else
            Call KondisiAwal()
        End If
    End Sub
End Class