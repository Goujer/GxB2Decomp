using System;
using System.IO;

namespace Org.BouncyCastle.Crypto.Tls
{
	public class TlsFatalAlert : IOException
	{
		private readonly byte alertDescription;

		public virtual byte AlertDescription
		{
			get
			{
				return 0;
			}
		}

		public TlsFatalAlert(byte alertDescription)
		{
		}

		public TlsFatalAlert(byte alertDescription, Exception alertCause)
		{
		}
	}
}
