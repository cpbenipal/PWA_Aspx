Imports System
Imports System.Globalization

Namespace EPRPWAspx.App_Code
    Public Module Commonfunction
        Public Function UTCtoOther(ByVal timeUtc As Date, ByVal ToTimeZone As String) As Date
            Try
                Dim cstZone As TimeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(ToTimeZone)
                Dim cstTime As Date = TimeZoneInfo.ConvertTimeFromUtc(timeUtc, cstZone)
                Console.WriteLine("The date and time are {0} {1}.", cstTime, If(cstZone.IsDaylightSavingTime(cstTime), cstZone.DaylightName, cstZone.StandardName))
                Return cstTime
            Catch ex As TimeZoneNotFoundException
                Return timeUtc
            Catch ex As InvalidTimeZoneException
                Return timeUtc
            End Try
        End Function

        Public Function CurrentDateTimeZone(ByVal ToTimeZone As String) As String
            Dim cstZone As TimeZoneInfo = TimeZoneInfo.FindSystemTimeZoneById(ToTimeZone)
            Dim cstTime As Date = TimeZoneInfo.ConvertTimeFromUtc(Date.UtcNow, cstZone)
            Return cstTime.ToString("dd/MM/yyyy hh:mm tt", CultureInfo.InvariantCulture) & " " & cstZone.StandardName
        End Function

        Public Function ConvertToUTC(ByVal Fromtime As Date) As Date
            Try
                Return TimeZoneInfo.ConvertTimeToUtc(Fromtime)
            Catch ex As TimeZoneNotFoundException
                Return Fromtime
            Catch ex As InvalidTimeZoneException
                Return Fromtime
            End Try
        End Function
    End Module
End Namespace
