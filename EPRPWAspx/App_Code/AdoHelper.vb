Imports System.Data
Imports System.Data.SqlClient

Namespace EPRPWAspx.App_Code
    Class AdoHelper

        Protected _connString As String = Nothing
        Protected _conn As SqlConnection = Nothing
        Protected _trans As SqlTransaction = Nothing
        Protected _disposed As Boolean = False
        Public Shared Property ConnectionString As String = ConfigurationManager.ConnectionStrings("connection").ConnectionString

        Public ReadOnly Property Transaction As SqlTransaction
            Get
                Return _trans
            End Get
        End Property

        Public Sub New()
            _connString = ConnectionString
            Connect()
        End Sub

        Public Sub New(ByVal connString As String)
            _connString = connString
            Connect()
        End Sub

        Protected Sub Connect()
            _conn = New SqlConnection(_connString)
            _conn.Open()
        End Sub

        Public Function CreateCommand(ByVal qry As String, ByVal type As CommandType, ParamArray args As Object()) As SqlCommand
            Dim cmd As SqlCommand = New SqlCommand(qry, _conn)
            If _trans IsNot Nothing Then cmd.Transaction = _trans
            cmd.CommandType = type

            For i As Integer = 0 To args.Length - 1

                If TypeOf args(i) Is String AndAlso i < (args.Length - 1) Then
                    Dim parm As SqlParameter = New SqlParameter With {
                        .ParameterName = CStr(args(i)),
                        .Value = args(System.Threading.Interlocked.Increment(i))
                    }
                    cmd.Parameters.Add(parm)
                ElseIf TypeOf args(i) Is SqlParameter Then
                    cmd.Parameters.Add(CType(args(i), SqlParameter))
                Else
                    Throw New ArgumentException("Invalid number or type of arguments supplied")
                End If
            Next

            Return cmd
        End Function

        Public Function ExecNonQuery(ByVal qry As String, ParamArray args As Object()) As Integer
            Using cmd As SqlCommand = CreateCommand(qry, CommandType.Text, args)
                Return cmd.ExecuteNonQuery()
            End Using
        End Function

        Public Function ExecNonQueryProc(ByVal proc As String, ParamArray args As Object()) As Integer
            Using cmd As SqlCommand = CreateCommand(proc, CommandType.StoredProcedure, args)
                Return cmd.ExecuteNonQuery()
            End Using
        End Function

        Public Function ExecScalar(ByVal qry As String, ParamArray args As Object()) As Object
            Using cmd As SqlCommand = CreateCommand(qry, CommandType.Text, args)
                Return cmd.ExecuteScalar()
            End Using
        End Function

        Public Function ExecScalarProc(ByVal qry As String, ParamArray args As Object()) As Object
            Using cmd As SqlCommand = CreateCommand(qry, CommandType.StoredProcedure, args)
                Return cmd.ExecuteScalar()
            End Using
        End Function

        Public Function ExecDataReader(ByVal qry As String, ParamArray args As Object()) As SqlDataReader
            Using cmd As SqlCommand = CreateCommand(qry, CommandType.Text, args)
                Return cmd.ExecuteReader()
            End Using
        End Function

        Public Function ExecDataReaderProc(ByVal qry As String, ParamArray args As Object()) As SqlDataReader
            Using cmd As SqlCommand = CreateCommand(qry, CommandType.StoredProcedure, args)
                Return cmd.ExecuteReader()
            End Using
        End Function

        Public Function ExecDataSet(ByVal qry As String, ParamArray args As Object()) As DataSet
            Using cmd As SqlCommand = CreateCommand(qry, CommandType.Text, args)
                Dim adapt As SqlDataAdapter = New SqlDataAdapter(cmd)
                Dim ds As DataSet = New DataSet()
                adapt.Fill(ds)
                Return ds
            End Using
        End Function

        Public Function ExecDataSetProc(ByVal qry As String, ParamArray args As Object()) As DataSet
            Using cmd As SqlCommand = CreateCommand(qry, CommandType.StoredProcedure, args)
                Dim adapt As SqlDataAdapter = New SqlDataAdapter(cmd)
                Dim ds As DataSet = New DataSet()
                adapt.Fill(ds)
                Return ds
            End Using
        End Function

        Public Function BeginTransaction() As SqlTransaction
            Rollback()
            _trans = _conn.BeginTransaction()
            Return Transaction
        End Function

        Public Sub Commit()
            If _trans IsNot Nothing Then
                _trans.Commit()
                _trans = Nothing
            End If
        End Sub

        Public Sub Rollback()
            If _trans IsNot Nothing Then
                _trans.Rollback()
                _trans = Nothing
            End If
        End Sub

        Public Sub Dispose()
            Dispose(True)
            GC.SuppressFinalize(Me)
        End Sub

        Protected Sub Dispose(ByVal disposing As Boolean)
            If Not _disposed Then

                If disposing Then

                    If _conn IsNot Nothing Then
                        Rollback()
                        _conn.Dispose()
                        _conn = Nothing
                    End If
                End If

                _disposed = True
            End If
        End Sub

    End Class
End Namespace
