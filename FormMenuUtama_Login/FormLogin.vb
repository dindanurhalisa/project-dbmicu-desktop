Imports System.Data.SqlClient
Public Class FormLogin

    Sub bukakunci()
        FormMenuUtama.LoginToolStripMenuItem.Enabled = False
        FormMenuUtama.LogoutToolStripMenuItem.Enabled = True
        FormMenuUtama.MasterToolStripMenuItem.Enabled = True
        FormMenuUtama.TransaksiToolStripMenuItem.Enabled = True
        FormMenuUtama.LaporanToolStripMenuItem.Enabled = True
    End Sub

    Private Sub Cancel_Click(sender As Object, e As EventArgs) Handles Cancel.Click
        Me.Close()
    End Sub

    Private Sub Login_Click(sender As Object, e As EventArgs) Handles Login.Click
        Call koneksi()
        cmd = New SqlCommand("Select * from tbl_pegawai where KodePegawai = '" & Username.Text & "' and PasswordPegawai = '" & Password.Text & "'", conn)
        rd = cmd.ExecuteReader
        rd.Read()
        If rd.HasRows Then
            Me.Close()
            Call bukakunci()
        Else
            MsgBox("Kode pegawai atau password salah")
            Username.Text = ""
            Password.Text = ""
        End If
    End Sub
End Class





