using System;

namespace Org.BouncyCastle.Security
{
	[Serializable]
	public class InvalidParameterException : KeyException
	{
		public InvalidParameterException()
		{
		}

		public InvalidParameterException(string message)
		{
		}

		public InvalidParameterException(string message, Exception exception)
		{
		}
	}
}
