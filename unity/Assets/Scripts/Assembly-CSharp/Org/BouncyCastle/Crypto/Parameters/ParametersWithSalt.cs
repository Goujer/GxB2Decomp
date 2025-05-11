namespace Org.BouncyCastle.Crypto.Parameters
{
	public class ParametersWithSalt : ICipherParameters
	{
		private byte[] salt;

		private ICipherParameters parameters;

		public ICipherParameters Parameters
		{
			get
			{
				return null;
			}
		}

		public ParametersWithSalt(ICipherParameters parameters, byte[] salt)
		{
		}

		public ParametersWithSalt(ICipherParameters parameters, byte[] salt, int saltOff, int saltLen)
		{
		}

		public byte[] GetSalt()
		{
			return null;
		}
	}
}
