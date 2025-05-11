using System;

namespace Org.BouncyCastle.Crypto
{
	[Serializable]
	public class OutputLengthException : DataLengthException
	{
		public OutputLengthException()
		{
		}

		public OutputLengthException(string message)
		{
		}

		public OutputLengthException(string message, Exception exception)
		{
		}
	}
}
