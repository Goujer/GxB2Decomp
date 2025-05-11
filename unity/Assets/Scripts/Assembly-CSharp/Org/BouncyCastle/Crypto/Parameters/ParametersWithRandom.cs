using System;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ParametersWithRandom : ICipherParameters
	{
		private readonly ICipherParameters parameters;

		private readonly SecureRandom random;

		public SecureRandom Random
		{
			get
			{
				return null;
			}
		}

		public ICipherParameters Parameters
		{
			get
			{
				return null;
			}
		}

		public ParametersWithRandom(ICipherParameters parameters, SecureRandom random)
		{
		}

		public ParametersWithRandom(ICipherParameters parameters)
		{
		}

		[Obsolete]
		public SecureRandom GetRandom()
		{
			return null;
		}
	}
}
