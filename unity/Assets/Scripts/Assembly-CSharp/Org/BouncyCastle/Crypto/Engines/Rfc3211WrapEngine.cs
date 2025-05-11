using Org.BouncyCastle.Crypto.Modes;
using Org.BouncyCastle.Crypto.Parameters;
using Org.BouncyCastle.Security;

namespace Org.BouncyCastle.Crypto.Engines
{
	public class Rfc3211WrapEngine : IWrapper
	{
		private CbcBlockCipher engine;

		private ParametersWithIV param;

		private bool forWrapping;

		private SecureRandom rand;

		public virtual string AlgorithmName
		{
			get
			{
				return null;
			}
		}

		public Rfc3211WrapEngine(IBlockCipher engine)
		{
		}

		public virtual void Init(bool forWrapping, ICipherParameters param)
		{
		}

		public virtual byte[] Wrap(byte[] inBytes, int inOff, int inLen)
		{
			return null;
		}

		public virtual byte[] Unwrap(byte[] inBytes, int inOff, int inLen)
		{
			return null;
		}
	}
}
