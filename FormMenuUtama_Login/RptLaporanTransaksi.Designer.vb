<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class RptLaporanTransaksi
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container()
        Dim ReportDataSource1 As Microsoft.Reporting.WinForms.ReportDataSource = New Microsoft.Reporting.WinForms.ReportDataSource()
        Me.tbl_laporantransaksiBindingSource = New System.Windows.Forms.BindingSource(Me.components)
        Me.DB_MICUDataSet = New FormMenuUtama_Login.DB_MICUDataSet()
        Me.ReportViewer1 = New Microsoft.Reporting.WinForms.ReportViewer()
        Me.tbl_laporantransaksiTableAdapter = New FormMenuUtama_Login.DB_MICUDataSetTableAdapters.tbl_laporantransaksiTableAdapter()
        CType(Me.tbl_laporantransaksiBindingSource, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me.DB_MICUDataSet, System.ComponentModel.ISupportInitialize).BeginInit()
        Me.SuspendLayout()
        '
        'tbl_laporantransaksiBindingSource
        '
        Me.tbl_laporantransaksiBindingSource.DataMember = "tbl_laporantransaksi"
        Me.tbl_laporantransaksiBindingSource.DataSource = Me.DB_MICUDataSet
        '
        'DB_MICUDataSet
        '
        Me.DB_MICUDataSet.DataSetName = "DB_MICUDataSet"
        Me.DB_MICUDataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'ReportViewer1
        '
        Me.ReportViewer1.Dock = System.Windows.Forms.DockStyle.Fill
        ReportDataSource1.Name = "DataSet1"
        ReportDataSource1.Value = Me.tbl_laporantransaksiBindingSource
        Me.ReportViewer1.LocalReport.DataSources.Add(ReportDataSource1)
        Me.ReportViewer1.LocalReport.ReportEmbeddedResource = "FormMenuUtama_Login.RptLaporanTransaksi.rdlc"
        Me.ReportViewer1.Location = New System.Drawing.Point(0, 0)
        Me.ReportViewer1.Name = "ReportViewer1"
        Me.ReportViewer1.Size = New System.Drawing.Size(1056, 550)
        Me.ReportViewer1.TabIndex = 0
        '
        'tbl_laporantransaksiTableAdapter
        '
        Me.tbl_laporantransaksiTableAdapter.ClearBeforeFill = True
        '
        'RptLaporanTransaksi
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(9.0!, 20.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1056, 550)
        Me.Controls.Add(Me.ReportViewer1)
        Me.Name = "RptLaporanTransaksi"
        Me.Text = "RptLaporanTransaksi"
        Me.WindowState = System.Windows.Forms.FormWindowState.Maximized
        CType(Me.tbl_laporantransaksiBindingSource, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me.DB_MICUDataSet, System.ComponentModel.ISupportInitialize).EndInit()
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents ReportViewer1 As Microsoft.Reporting.WinForms.ReportViewer
    Friend WithEvents tbl_laporantransaksiBindingSource As System.Windows.Forms.BindingSource
    Friend WithEvents DB_MICUDataSet As FormMenuUtama_Login.DB_MICUDataSet
    Friend WithEvents tbl_laporantransaksiTableAdapter As FormMenuUtama_Login.DB_MICUDataSetTableAdapters.tbl_laporantransaksiTableAdapter
End Class
