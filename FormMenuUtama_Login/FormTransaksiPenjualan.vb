Imports System.Data.SqlClient
Public Class FormTransaksiPenjualan
    Sub KondisiAwal()
        LBLNoTransaksi.Text = ""
        LBLTglTransaksi.Text = Today
        LBLNama.Text = ""
        LBLKembalian.Text = ""
        TextBox3.Text = ""
        LBLNamaMenu.Text = ""
        LBLHarga.Text = ""
        TextBox2.Text = ""
        TextBox2.Enabled = False
        TextBox1.Text = ""
        LBLItem.Text = ""
        Call MunculKodePembeli()
        Call NoOtomatis()
        Call buatKolom()
        Label11.Text = "0"
    End Sub

    Private Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        LBLJamTransaksi.Text = TimeOfDay
    End Sub

    Private Sub FormTransaksiPenjualan_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Call KondisiAwal()
    End Sub

    Sub MunculKodePembeli()
        Call koneksi()
        ComboBox1.Items.Clear()
        cmd = New SqlCommand("Select * from tbl_pembeli", conn)
        rd = cmd.ExecuteReader
        Do While rd.Read
            ComboBox1.Items.Add(rd.Item(0))
        Loop
    End Sub

    Private Sub ComboBox1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles ComboBox1.SelectedIndexChanged
        Call koneksi()
        cmd = New SqlCommand("Select * from tbl_pembeli where KodePembeli = '" & ComboBox1.Text & "'", conn)
        rd = cmd.ExecuteReader
        rd.Read()
        If rd.HasRows Then
            LBLNama.Text = rd!NamaPembeli
        End If
    End Sub

    Sub NoOtomatis()
        Call koneksi()
        cmd = New SqlCommand("Select * from tbl_transaksi where NoTransaksi in (select max(NoTransaksi) from tbl_transaksi)", conn)
        Dim urutankode As String
        Dim hitung As Long
        rd = cmd.ExecuteReader
        rd.Read()
        If Not rd.HasRows Then
            urutankode = "TRK" + "0000001"
        Else
            hitung = Microsoft.VisualBasic.Right(rd.GetString(0), 7) + 1
            urutankode = "TRK" + Microsoft.VisualBasic.Right("0000000" & hitung, 7)
        End If
        LBLNoTransaksi.Text = urutankode
    End Sub

    Sub buatKolom()
        DataGridView1.Columns.Clear()
        DataGridView1.Columns.Add("Kode", "Kode")
        DataGridView1.Columns.Add("Nama", "Nama Menu")
        DataGridView1.Columns.Add("Harga", "Harga")
        DataGridView1.Columns.Add("Jumlah", "Jumlah")
        DataGridView1.Columns.Add("SubTotal", "SubTotal")
    End Sub

    Sub RumusSubTotal()
        Dim hitung As Integer = 0
        For i As Integer = 0 To DataGridView1.Rows.Count - 1
            hitung = hitung + DataGridView1.Rows(i).Cells(4).Value
            Label11.Text = hitung
        Next
    End Sub

    Private Sub Button4_Click(sender As Object, e As EventArgs) Handles Button4.Click
        If LBLNamaMenu.Text = "" Or TextBox2.Text = "" Then
            MsgBox("Silahkan masukan kode barang dan tekan ENTER")
        Else
            DataGridView1.Rows.Add(New String() {TextBox3.Text, LBLNamaMenu.Text, LBLHarga.Text, TextBox2.Text, Val(LBLHarga.Text) * Val(TextBox2.Text)})
            Call RumusSubTotal()
            TextBox3.Text = ""
            LBLNamaMenu.Text = ""
            LBLHarga.Text = ""
            TextBox2.Text = ""
            TextBox2.Enabled = False
            Call rumusCariItem()
        End If
    End Sub

    Private Sub TextBox3_KeyPress(sender As Object, e As KeyPressEventArgs) Handles TextBox3.KeyPress
        If e.KeyChar = Chr(13) Then
            Call koneksi()
            cmd = New SqlCommand("Select * from tbl_menu where KodeMenu='" & TextBox3.Text & "'", conn)
            rd = cmd.ExecuteReader
            rd.Read()
            If Not rd.HasRows Then
                MsgBox("Kode Barang tidak ada")
            Else
                TextBox3.Text = rd.Item("KodeMenu")
                LBLNamaMenu.Text = rd.Item("NamaMenu")
                LBLHarga.Text = rd.Item("HargaMenu")
                TextBox2.Enabled = True
            End If
        End If
    End Sub

    Private Sub TextBox1_KeyPress(sender As Object, e As KeyPressEventArgs) Handles TextBox1.KeyPress
        If e.KeyChar = Chr(13) Then
            If Val(TextBox1.Text) < Val(Label11.Text) Then
                MsgBox("Pembayaran Kurang!")
            ElseIf Val(TextBox1.Text) = Val(Label11.Text) Then
                LBLKembalian.Text = 0
            ElseIf Val(TextBox1.Text) > Val(Label11.Text) Then
                LBLKembalian.Text = Val(TextBox1.Text) - Val(Label11.Text)
                Button1.Focus()
            End If
        End If
    End Sub

    Sub rumusCariItem()
        Dim hitungitem As Integer = 0
        For i As Integer = 0 To DataGridView1.Rows.Count - 1
            hitungitem = hitungitem + DataGridView1.Rows(i).Cells(3).Value
            LBLItem.Text = hitungitem
        Next
    End Sub

    Private Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        If LBLKembalian.Text = "" Or LBLNama.Text = "" Or Label11.Text = "" Then
            MsgBox("Transaksi tidak ada, silahkan melakukan transaksi terlebih dahulu")
        Else
            Call koneksi()
            Dim tgl As String
            tgl = Format(Today, "yyyy-MM-dd")
            Dim simpanjual As String = "insert into tbl_transaksi values ('" & LBLNoTransaksi.Text & "', '" & tgl & "', '" & LBLJamTransaksi.Text & "', '" & ComboBox1.Text & "', '" & LBLItem.Text & "', '" & Label11.Text & "', '" & TextBox1.Text & "', '" & LBLKembalian.Text & "')"
            cmd = New SqlCommand(simpanjual, conn)
            cmd.ExecuteNonQuery()

            For Baris As Integer = 0 To DataGridView1.Rows.Count - 2
                Call koneksi()
                Dim simpandetail As String = "insert into tbl_detailtransaksi values ('" & LBLNoTransaksi.Text & "', '" & DataGridView1.Rows(Baris).Cells(0).Value & "', '" & DataGridView1.Rows(Baris).Cells(1).Value & "', '" & DataGridView1.Rows(Baris).Cells(2).Value & "', '" & DataGridView1.Rows(Baris).Cells(3).Value & "', '" & DataGridView1.Rows(Baris).Cells(4).Value & "')"
                cmd = New SqlCommand(simpandetail, conn)
                cmd.ExecuteNonQuery()
                Call koneksi()
                cmd = New SqlCommand("Select * from tbl_menu where KodeMenu='" & DataGridView1.Rows(Baris).Cells(0).Value & "'", conn)
                rd = cmd.ExecuteReader
                rd.Read()
                Call koneksi()
                Dim kurangistok As String = "Update tbl_menu set StokMenu ='" & rd.Item("StokMenu") - DataGridView1.Rows(Baris).Cells(3).Value & "' where KodeMenu='" & DataGridView1.Rows(Baris).Cells(0).Value & "'"
                cmd = New SqlCommand(kurangistok, conn)
                cmd.ExecuteNonQuery()
            Next
            Call koneksi()
            Dim laporantransaksi As String = "insert into tbl_laporantransaksi values ('" & LBLNoTransaksi.Text & "', '" & LBLNama.Text & "', '" & LBLItem.Text & "', '" & Label11.Text & "')"
            cmd = New SqlCommand(laporantransaksi, conn)
            cmd.ExecuteNonQuery()
            Call KondisiAwal()
            MsgBox("Transaksi Berhasil Disimpan!")
        End If
    End Sub

    Private Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Me.Close()
    End Sub

    Private Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Call KondisiAwal()
    End Sub
End Class