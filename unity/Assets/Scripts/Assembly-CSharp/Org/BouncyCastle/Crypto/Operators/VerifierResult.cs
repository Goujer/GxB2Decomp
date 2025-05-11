namespace Org.BouncyCastle.Crypto.Operators
{
	internal class VerifierResult : IVerifier
	{
		private readonly ISigner sig;

		internal VerifierResult(ISigner sig)
		{
		}

		public bool IsVerified(byte[] signature)
		{
			return false;
		}

		public bool IsVerified(byte[] signature, int off, int length)
		{
			return false;
		}
	}
}
